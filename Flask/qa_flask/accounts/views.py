import hashlib

from flask import Blueprint, render_template, flash, redirect, url_for

from accounts.forms import RegisterForm
from models import User, db, UserProfile

accounts = Blueprint('accounts', __name__, template_folder='templates', static_folder='../assets')


@accounts.route('/login')
def login():
    """ 登录 """
    return render_template('login.html')


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
