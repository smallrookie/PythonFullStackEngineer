from datetime import datetime

from flask_sqlalchemy import SQLAlchemy

from utils import constants

db = SQLAlchemy()


class User(db.Model):
    """ 用户模型 """
    __tablename__ = 'accounts_user'
    # 主键
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # 用户名
    username = db.Column(db.String(64), unique=True, nullable=False)
    # 用户昵称
    nickname = db.Column(db.String(64))
    # 登录密码
    password = db.Column(db.String(256), nullable=False)
    # 用户头像地址
    avatar = db.Column(db.String(256))
    # 用户状态
    status = db.Column(db.SmallInteger, default=constants.UserStatus.USER_ACTIVE.value, comment='用户状态')
    # 是否为超级管理员
    is_super = db.Column(db.SmallInteger, default=constants.UserRole.COMMON.value)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    @property
    def is_authenticated(self):
        """ This property should return True if the user is authenticated, i.e. they have provided valid credentials.
        (Only authenticated users will fulfill the criteria of login_required.) """
        return True

    @property
    def is_active(self):
        """ This property should return True if this is an active user - in addition to being authenticated,
        they also have activated their account, not been suspended, or any condition your application has
        for rejecting an account. Inactive accounts may not log in (without being forced of course)."""
        return self.status == constants.UserStatus.USER_ACTIVE.value

    @property
    def is_anonymous(self):
        """ This property should return True if this is an anonymous user.
        (Actual users should return False instead.) """
        return False

    def get_id(self):
        """ This method must return a unicode that uniquely identifies this user,
        and can be used to load the user from the user_loader callback.
        Note that this must be a unicode - if the ID is natively an int or some other type,
        you will need to convert it to unicode. """
        return '{}'.format(self.id)

    def __str__(self):
        return self.nickname


class UserProfile(db.Model):
    """ 用户详细信息 """
    __tablename__ = 'accounts_user_profile'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 用户名
    username = db.Column(db.String(64), unique=True, nullable=False)
    # 用户真实姓名
    real_name = db.Column(db.String(64))
    # 个性签名
    maxim = db.Column(db.String(128))
    # 性别
    gender = db.Column(db.String(16))
    # 地址
    address = db.Column(db.String(256))
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 建立用户模型表与用户详细信息表一对一关系
    user = db.relationship('User', backref=db.backref('profile', uselist=False))


class UserLoginHistory(db.Model):
    """ 用户登录历史 """
    __tablename__ = 'accounts_user_login_history'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 用户名
    username = db.Column(db.String(64), nullable=False)
    # 账号平台
    login_type = db.Column(db.String(32))
    # IP地址
    ip = db.Column(db.String(32))
    # user-agent
    ua = db.Column(db.String(256))
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 建立用户模型表与用户登录历史表一对多关系
    user = db.relationship('User', backref=db.backref('login_history_list', lazy='dynamic'))


class Question(db.Model):
    """ 问题 """
    __tablename__ = 'qa_question'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 问题标题
    title = db.Column(db.String(128), nullable=False)
    # 问题描述
    desc = db.Column(db.String(256))
    # 问题图片
    img = db.Column(db.String(256))
    # 问题详情
    content = db.Column(db.Text, nullable=False)
    # 浏览人数
    view_count = db.Column(db.Integer, default=0)
    # 逻辑删除
    is_valid = db.Column(db.Boolean, default=True)
    # 排序
    reorder = db.Column(db.Integer, default=0)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 建立用户模型表与问题表的一对多关系
    user = db.relationship('User', backref=db.backref('question_list', lazy='dynamic'))

    @property
    def comment_count(self):
        """ 评论数 """
        return self.question_comment_list.filter_by(is_valid=True).count()

    @property
    def follow_count(self):
        """ 关注数 """
        return self.question_follow_list.filter_by(is_valid=True).count()


class QuestionTags(db.Model):
    """ 问题标签 """
    __tablename__ = 'qa_question_tags'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 标签名称
    tag_name = db.Column(db.String(16), nullable=False)
    # 逻辑删除
    is_valid = db.Column(db.Boolean, default=True)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)

    # 外键-关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 建立问题标签表与问题表的一对多关系
    question = db.relationship('Question', backref=db.backref('tag_list', lazy='dynamic'))


class Answer(db.Model):
    """ 回答 """
    __tablename__ = 'qa_answer'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 回答的内容详情
    content = db.Column(db.Text, nullable=False)
    # 逻辑删除
    is_valid = db.Column(db.Boolean, default=True)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键-关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 建立回答表与用户模型表的一对多关系
    user = db.relationship('User', backref=db.backref('answer_list', lazy='dynamic'))
    # 建立回答表与问题表的一对多关系
    question = db.relationship('Question', backref=db.backref('answer_list', lazy='dynamic'))

    @property
    def love_count(self):
        """ 点赞数 """
        return self.answer_love_list.count()


class AnswerComment(db.Model):
    """ 评论 """
    __tablename__ = 'qa_answer_comment'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 评论内容
    content = db.Column(db.String(512), nullable=False)
    # 赞同人数
    love_count = db.Column(db.Integer, default=0)
    # 评论是否公开
    is_public = db.Column(db.Boolean, default=True)
    # 逻辑删除
    is_valid = db.Column(db.Boolean, default=True)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 最后修改时间
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    # 回复ID
    reply_id = db.Column(db.Integer, db.ForeignKey('qa_answer_comment.id'), nullable=True)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键-关联答案
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 外键-关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 建立评论表与用户模型表的一对多关系
    user = db.relationship('User', backref=db.backref('answer_comment_list', lazy='dynamic'))
    # 建立评论表与答案表的一对多关系
    answer = db.relationship('Answer', backref=db.backref('answer_comment_list', lazy='dynamic'))
    # 建立评论表与问题表的一对多关系
    question = db.relationship('Question', backref=db.backref('question_comment_list', lazy='dynamic'))


class AnswerLove(db.Model):
    """ 回答点赞 """
    __tablename__ = 'qa_answer_love'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键-关联答案
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 外键-关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 建立回答点赞表与用户模型表的一对多关系
    user = db.relationship('User', backref=db.backref('answer_love_list', lazy='dynamic'))
    # 建立回答点赞表与答案表的一对多关系
    answer = db.relationship('Answer', backref=db.backref('answer_love_list', lazy='dynamic'))
    # 建立回答点赞表与问题表的一对多关系
    question = db.relationship('Question', backref=db.backref('question_love_list', lazy='dynamic'))


class AnswerCollect(db.Model):
    """ 收藏回答 """
    __tablename__ = 'qa_answer_collect'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 创建时间
    created_at = db.Column(db.DateTime, default=datetime.now)
    # 逻辑删除
    is_valid = db.Column(db.Boolean, default=True)

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键-关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 外键-关联答案
    answer_id = db.Column(db.Integer, db.ForeignKey('qa_answer.id'))
    # 建立收藏回答表与用户模型表的一对多关系
    user = db.relationship('User', backref=db.backref('answer_collect_list', lazy='dynamic'))
    # 建立收藏回答表与问题表的一对多关系
    question = db.relationship('Question', backref=db.backref('question_collect_list', lazy='dynamic'))
    # 建立收藏回答表与答案表的一对多关系
    answer = db.relationship('Answer', backref=db.backref('answer_collect_list', lazy='dynamic'))


class QuestionFollow(db.Model):
    """ 关注问题 """
    __tablename__ = 'qa_question_follow'
    # 主键
    id = db.Column(db.Integer, primary_key=True)
    # 创建时间
    created_at = db.Column(db.DateTime)
    # 逻辑删除
    is_valid = db.Column(db.Boolean, default=True, comment='逻辑删除')

    # 外键-关联用户模型
    user_id = db.Column(db.Integer, db.ForeignKey('accounts_user.id'))
    # 外键-关联问题
    q_id = db.Column(db.Integer, db.ForeignKey('qa_question.id'))
    # 建立关注问题表与用户模型表的一对多关系
    user = db.relationship('User', backref=db.backref('question_follow_list', lazy='dynamic'))
    # 建立关注问题表与问题表的一对多关系
    question = db.relationship('Question', backref=db.backref('question_follow_list', lazy='dynamic'))
