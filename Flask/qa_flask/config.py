import os


class Config(object):
    """ 项目配置文件 """
    # 数据库配置URI
    SQLALCHEMY_DATABASE_URI = 'mysql://root:0321@localhost/flask_qa'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # Flash/Form
    SECRET_KEY = '0321'
    # 文件上传根路径
    MEDIA_ROOT = os.path.join(os.path.dirname(__file__), 'medias')
