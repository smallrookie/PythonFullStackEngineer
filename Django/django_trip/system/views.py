from django.core.cache import cache
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from system.models import Slider


def slider_list(request):
    """ 轮播图接口
    {
        "meta": {},
        "objects": []
    }
    """
    data = {
        'meta': {},
        'objects': []
    }
    queryset = Slider.objects.filter(is_valid=True)
    for item in queryset:
        data['objects'].append({
            'id': item.id,
            'name': item.name,
            'img_url': item.img.url,
            'target_url': item.target_url
        })
    return JsonResponse(data)


def cache_set(request):
    """ 写缓存 """
    cache.set('username', 'test')
    cache.set('password', '123456', timeout=5)
    return HttpResponse('ok')


def cache_get(request):
    """ 读缓存 """
    value = cache.get('username')
    return HttpResponse(value)
