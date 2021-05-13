from flask import Flask

from models import db
from accounts.views import accounts
from qa.views import qa

app = Flask(__name__, static_folder='assets')
# 加载配置
app.config.from_object('config.Config')
# 数据库初始化
db.init_app(app)

# 注册蓝图
app.register_blueprint(accounts, url_prefix='/accounts')
app.register_blueprint(qa, url_prefix='/')

if __name__ == '__main__':
    app.run()
