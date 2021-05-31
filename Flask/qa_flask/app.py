from flask import Flask, session, g

from models import db, User
from accounts.views import accounts
from qa.views import qa
from utils.filters import number_split

app = Flask(__name__, static_folder='assets')
# 加载配置
app.config.from_object('config.Config')
# 数据库初始化
db.init_app(app)

# 注册蓝图
app.register_blueprint(accounts, url_prefix='/accounts')
app.register_blueprint(qa, url_prefix='/')

# 注册数字格式化过滤器
app.jinja_env.filters['number_split'] = number_split


@app.before_request
def before_request():
    """ 设置全局用户对象 """
    user_id = session.get('user_id', None)
    if user_id:
        user = User.query.get(user_id)
        g.current_user = user


if __name__ == '__main__':
    app.run()
