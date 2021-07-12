<template>
  <div class="page-home">
    <h1>慕旅游网</h1>
  </div>
</template>

<script>
// @ is an alias to /src
import axios from 'axios'

export default {
  name: 'Home',
  components: {},
  created () {
    axios
      .get('http://django.t.mukewang.com/api/system/slider/list/?types=11')
      .then((resp) => {
        console.log('返回结果为: ', resp)
      })
      .catch((err) => {
        console.log('请求错误: ', err)
      })
  }
}
</script>
