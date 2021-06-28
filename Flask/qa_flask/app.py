from flask import Flask, session, g
from flask_ckeditor import CKEditor
from flask_login import LoginManager

from models import db, User
from accounts.views import accounts
from qa.views import qa
from utils.filters import number_split

app = Flask(__name__, static_folder='medias')
# 加载配置
app.config.from_object('config.Config')
# 数据库初始化
db.init_app(app)
# 富文本编辑器初始化
ckeditor = CKEditor()
ckeditor.init_app(app)
# 登录验证
login_manager = LoginManager()
login_manager.login_view = "accounts.login"
login_manager.login_message = "请登录"
login_manager.login_message_category = "danger"
login_manager.init_app(app)

# 注册蓝图
app.register_blueprint(accounts, url_prefix='/accounts')
app.register_blueprint(qa, url_prefix='/')

# 注册数字格式化过滤器
app.jinja_env.filters['number_split'] = number_split


# @app.before_request
# def before_request():
#     """ 设置全局用户对象 """
#     user_id = session.get('user_id', None)
#     if user_id:
#         user = User.query.get(user_id)
#         g.current_user = user


@login_manager.user_loader
def load_user(user_id):
    """ This callback is used to reload the user object from the user ID stored in the session.
    It should take the unicode ID of a user, and return the corresponding user object.  """
    return User.query.get(user_id)
