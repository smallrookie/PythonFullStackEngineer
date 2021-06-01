from flask_login import current_user
from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed
from wtforms import FileField, StringField, TextAreaField
from wtforms.validators import DataRequired, Length

from models import Question, db


class WriteQuestionForm(FlaskForm):
    """ 写文章/问题 """
    img = FileField(label="上传图片", render_kw={
        "accept": ".jpeg, .jpg, .png"
    }, validators=[FileAllowed(['jpeg', 'jpg', 'png'], '请选择合适的图片类型')])
    title = StringField(label="标题", render_kw={
        "class": "form-control",
        "placeholder": "请输入标题（最多50个字）"
    }, validators=[DataRequired('请输入标题'), Length(min=2, max=50, message='标题长度为2-50字')])
    tags = StringField(label="标签", render_kw={
        "class": "form-control",
        "placeholder": "输入标签，用,分隔"
    })
    desc = StringField(label="描述", render_kw={
        "class": "form-control",
        "placeholder": "简述"
    }, validators=[Length(max=150, message='描述最长150字')])
    content = TextAreaField(label="文章/问题内容", render_kw={
        "class": "form-control",
        "placeholder": "请输入正文"
    }, validators=[DataRequired('请输入正文'), Length(min=5, message='不能少于5个字符')])

    def save(self):
        """ 文章/问题发布 """
        # 获取图片
        # 保存问题
        title = self.title.data
        desc = self.desc.data
        content = self.content.data

        que_obj = Question(title=title, desc=desc, content=content, user=current_user)
        db.session.add(que_obj)
        db.session.commit()
        # 保存标签
        return que_obj
