import hashlib

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError

from models import User, db, UserProfile
from utils.validators import phone_required


class RegisterForm(FlaskForm):
    """ 用户注册 """
    username = StringField(label='用户名', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请输入用户名'
    }, validators=[DataRequired('请输入用户名'), phone_required])
    nickname = StringField(label='用户昵称', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请输入昵称'
    }, validators=[DataRequired('请输入昵称'),
                   Length(min=2, max=20, message='昵称长度为2-20之间')])
    password = PasswordField(label='密码', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请输入密码'
    }, validators=[DataRequired('请输入密码')])
    confirm_password = PasswordField(label='确认密码', render_kw={
        'class': 'form-control input-lg',
        'placeholder': '请确认密码'
    }, validators=[DataRequired('请确认密码'),
                   EqualTo('password', message='两次密码输入不一致')])

    def validate_username(self, field):
        """ 验证用户名是否唯一 """
        user = User.query.filter_by(username=field.data).first()
        if user:
            raise ValidationError('该用户名已存在')
        return field

    def register(self):
        """ 用户注册-业务逻辑 """
        # 获取表单信息
        username = self.username.data
        password = self.password.data
        nickname = self.nickname.data
        try:
            # 密码加密存储
            password = hashlib.sha256(password.encode()).hexdigest()

            # 将user信息添加至db.session
            user_obj = User(username=username, password=password, nickname=nickname)
            db.session.add(user_obj)
            # 将userprofile信息添加至db.session
            profile = UserProfile(username=username, user=user_obj)
            db.session.add(profile)
            # db.session提交
            db.session.commit()

            return user_obj
        except Exception as e:
            print(e)

        return None
