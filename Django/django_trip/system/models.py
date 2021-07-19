from django.db import models


# Create your models here.
class Slider(models.Model):
    name = models.CharField('名称', max_length=32)
    desc = models.CharField('描述', max_length=100, null=True, blank=True)
    types = models.SmallIntegerField('展现位置', default=10)
    img = models.ImageField('图片地址', max_length=255, upload_to='%Y%m/slider')
    reorder = models.SmallIntegerField('排序字段', default=0, help_text='递减')
    start_time = models.DateTimeField('生效开始时间', null=True, blank=True)
    end_time = models.DateTimeField('生效结束时间', null=True, blank=True)
    target_url = models.CharField('跳转地址', max_length=255, null=True, blank=True)
    is_valid = models.BooleanField('是否有效', default=True)
    created_at = models.DateTimeField('创建时间', auto_now_add=True)
    updated_at = models.DateTimeField('修改时间', auto_now=True)

    class Meta:
        db_table = 'system_slider'
        ordering = ['-reorder']
