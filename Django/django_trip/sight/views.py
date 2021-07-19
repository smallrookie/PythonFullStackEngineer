from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from django.views.generic import ListView

from sight.models import Sight


class SightListView(ListView):
    """ 景点列表 """
    # 每页5条数据
    paginate_by = 5

    def get_queryset(self):
        """ 重写查询方法 """
        query = Q(is_valid=True)
        # 热门景点
        is_hot = self.request.GET.get('is_hot', None)
        if is_hot:
            query = query & Q(is_hot=True)
        # 精选景点
        is_top = self.request.GET.get('is_top', None)
        if is_top:
            query = query & Q(is_top=True)
        # TODO: 景点名称搜索
        queryset = Sight.objects.filter(query)
        return queryset

    def render_to_response(self, context, **response_kwargs):
        page_obj = context['page_obj']
        data = {
            'meta': {
                # 记录条数
                'total_count': page_obj.paginator.count,
                # 总页数
                'page_count': page_obj.paginator.num_pages,
                # 当前页
                'current_page': page_obj.number
            },
            'objects': []
        }
        for item in page_obj.object_list:
            data['objects'].append({
                'id': item.id,
                'name': item.name,
                'main_img': item.main_img.url,
                'score': item.score,
                'province': item.province,
                'city': item.city,
                # TODO: 评论数
                'comment_count': 0
            })
        return JsonResponse(data)
