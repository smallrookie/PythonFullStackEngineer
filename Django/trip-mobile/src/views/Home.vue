<template>
  <div class="page-home">
    <!--  Banner图  -->
    <Banner/>
  </div>
</template>

<script>
import Banner from '@/components/home/Banner'

export default {
  name: 'Home',
  // Banner图
  components: { Banner },
  created () {
  }
}
</script>
