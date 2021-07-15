<template>
  <div class="page-home">
    <!--  Banner图  -->
    <Banner />
    <!--  热门推荐景点  -->
    <Hot />
    <!-- 精选景点 -->
    <Fine />
  </div>
</template>

<script>
import Banner from '@/components/home/Banner'
import Hot from '@/components/home/Hot'
import Fine from '@/components/home/Fine'

export default {
  name: 'Home',
  components: {
    // Banner图
    Banner,
    // 热门推荐景点
    Hot,
    // 精选景点
    Fine
  },
  created () {}
}
</script>
