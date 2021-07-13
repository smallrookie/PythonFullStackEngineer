<template>
  <div class="page-home">
    <h1>慕旅游网</h1>
  </div>
</template>

<script>
// @ is an alias to /src
// import axios from 'axios'
import { ajax } from '@/utils/ajax'

export default {
  name: 'Home',
  components: {},
  created () {
    ajax.get('http://localhost:8080').then((resp) => {
      console.log('返回结果为: ', resp)
    }).catch((err) => {
      console.log('请求错误: ', err)
    })
  }
}
</script>
