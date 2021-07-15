<template>
  <div class="page-home">
    <!--  Banner图  -->
    <Banner/>
    <!--  热门推荐景点  -->
    <Hot/>
  </div>
</template>

<script>
import Banner from '@/components/home/Banner'
import Hot from '@/components/home/Hot'

export default {
  name: 'Home',
  components: {
    // Banner图
    Banner,
    // 热门推荐景点
    Hot
  },
  created () {
  }
}
</script>
