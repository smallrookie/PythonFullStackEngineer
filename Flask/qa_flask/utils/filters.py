from datetime import datetime

import timeago


def number_split(num):
    """
    数字格式化
    123456 => 12，345，678
    :param num: 需要格式化的数字
    :return: 格式化后的字符串
    """
    return '{:,}'.format(int(num))


def dt_format_show(dt):
    """ 日期/时间格式化 """
    now = datetime.now()
    return timeago.format(dt, now, 'zh_CN')
