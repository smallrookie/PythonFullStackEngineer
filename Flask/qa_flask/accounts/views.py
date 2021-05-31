import hashlib

from flask import Blueprint, render_template, flash, redirect, url_for, session, request

from accounts.forms import RegisterForm, LoginForm
from models import User, db, UserProfile, UserLoginHistory

accounts = Blueprint('accounts', __name__, template_folder='templates', static_folder='../assets')


@accounts.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        # 查找登录用户
        # TODO 验证加密后的密码是否正确
        user = User.query.filter_by(username=username, password=password).first()
        # 登录用户
        session['user_id'] = user.id

        # 日志记录
        ip = request.remote_addr
        ua = request.headers.get('user-agent', None)

        obj = UserLoginHistory(username=username, ip=ip, ua=ua, user=user)
        db.session.add(obj)
        db.session.commit()

        # 跳转至首页
        flash('{}, 欢迎回来'.format(user.nickname), 'success')
        return redirect(url_for('qa.index'))
    else:
        print(form.errors)
    """ 登录 """
    return render_template('login.html', form=form)


@accounts.route('/register', methods=['GET', 'POST'])
def register():
    """ 注册 """
    form = RegisterForm()
    if form.validate_on_submit():
        user_obj = form.register()
        if user_obj:
            # 跳转至登录页面
            flash('注册成功，请登录', 'success')
            return redirect(url_for('accounts.login'))
        else:
            flash('注册失败，请稍后再试', 'danger')

    return render_template('register.html', form=form)


@accounts.route('/mine')
def mine():
    """ 个人中心 """
    return render_template('mine.html')
