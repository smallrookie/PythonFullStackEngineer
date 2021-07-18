s<template>
  <div class="page-home">
    <!--  Banner图  -->
    <Banner />
    <!--  热门推荐景点  -->
    <Hot />
    <!-- 精选景点 -->
    <Fine />
    <!-- 底部导航栏 -->
    <trip-footer />
  </div>
</template>

<script>
import Banner from '@/components/home/Banner'
import Hot from '@/components/home/Hot'
import Fine from '@/components/home/Fine'
import TripFooter from '@/components/common/Footer'

export default {
  name: 'Home',
  components: {
    // Banner图
    Banner,
    // 热门推荐景点
    Hot,
    // 精选景点
    Fine,
    // 底部导航栏
    TripFooter
  },
  created () {}
}
</script>
