from flask import Blueprint, render_template, request, abort, flash, redirect, url_for, jsonify
from flask_login import login_required, current_user

from config import Config
from models import Question, Answer, AnswerComment, db
from qa.forms import WriteQuestionForm, WriteAnswerForm

qa = Blueprint('qa', __name__, template_folder='templates', static_folder='../assets')


@qa.route('/')
def index():
    """ 首页-回答列表 """
    page = int(request.args.get('page', 1))
    page_data = Answer.query.filter_by(is_valid=True).paginate(page=page, per_page=Config.per_page)
    return render_template('index.html', page_data=page_data)


@qa.route('/follow')
@login_required
def follow():
    """ 关注-问题列表 """
    page = int(request.args.get('page', 1))
    page_data = Question.query.filter_by(is_valid=True).paginate(page=page, per_page=Config.per_page)
    return render_template('follow.html', page_data=page_data)


@qa.route('qa/list')
def question_list():
    """ 查询问题数据列表 """
    try:
        page = int(request.args.get('page', 1))
        page_data = Question.query.filter_by(is_valid=True).paginate(page=page, per_page=Config.per_page)
        data = render_template('qa_list.html', page_data=page_data)
        return {'code': 0, 'data': data}
    except Exception as e:
        print(e)
        data = ''
    return {'code': 1, 'data': data}


@qa.route('/write', methods=['GET', 'POST'])
@login_required
def write():
    """ 写文章/提问 """
    form = WriteQuestionForm()
    if form.validate_on_submit():
        try:
            que_obj = form.save()
            if que_obj:
                flash('发布成功', 'success')
                return redirect(url_for('qa.index'))
            else:
                flash('发布失败，请稍后重试', 'danger')
        except Exception as e:
            print(e)
            flash('发布失败，请稍后重试', 'danger')
    return render_template('write.html', form=form)


@qa.route('/detail/<int:q_id>', methods=['GET', 'POST'])
def detail(q_id):
    """ 问题详情 """
    # 查询问题信息
    question = Question.query.get(q_id)
    if not question.is_valid:
        abort(404)
    # 展示第一条回答信息
    answer = question.answer_list.filter_by(is_valid=True).first()
    # 添加回答
    form = WriteAnswerForm()
    if form.validate_on_submit():
        try:
            if not current_user.is_authenticated:
                flash('请先登录', 'danger')
                return redirect(url_for('accounts.login'))
            form.save(question=question)
            flash('回答发布成功', 'success')
            return redirect(url_for('qa.detail', q_id=q_id))
        except Exception as e:
            print(e)
    return render_template('detail.html', question=question, answer=answer, form=form)


@qa.route('/comments/<int:answer_id>', methods=['GET', 'POST'])
def comments(answer_id):
    """ 评论 """
    answer = Answer.query.get(answer_id)
    # 获取评论列表
    if request.method == 'GET':
        pass
    # 添加评论
    else:
        try:
            if not current_user.is_authenticated:
                result = {'code': 1, 'message': '请登录'}
                return jsonify(result), 400
            # 获取评论
            content = request.form.get('content', '')
            reply_id = request.form.get('reply_id', None)
            comment_obj = AnswerComment(content=content,
                                        user=current_user,
                                        answer=answer,
                                        question=answer.question,
                                        reply_id=reply_id)
            # 保存评论
            db.session.add(comment_obj)
            db.session.commit()
            return '', 201
        except Exception as e:
            print(e)
            result = {'code': 1, 'message': '服务器正忙，请稍后重试'}
            return jsonify(result), 400
