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
