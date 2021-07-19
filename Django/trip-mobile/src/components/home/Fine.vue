<template>
  <!-- 首页精选景点 -->
  <div class="home-fine-box">
    <!--  顶部导航  -->
    <van-cell title="精选景点" icon="location-o" title-style="text-align:left" value="更多" is-link />
    <!--  // 顶部导航  -->
    <!-- 景点列表 -->
    <div class="box-main">
      <sight-item v-for="item in dataList" :key="item.id" :item="item"></sight-item>
    </div>
    <!-- // 景点列表 -->
  </div>
</template>
<script>
import { ajax } from '@/utils/ajax'
import { SightApis } from '@/utils/apis'
import SightItem from '@/components/common/ListSight.vue'
export default {
  components: {
    SightItem
  },
  data () {
    return {
      dataList: []
    }
  },
  methods: {
    getDataList () {
      ajax.get(SightApis.sliderListUrl, {
        params: {
          is_top: 1
        }
      }).then(({ data }) => {
        this.dataList = data.objects
      })
    }
  },
  created () {
    this.getDataList()
  }
}
</script>
<style lang="less">
  .home-fine-box {
    padding: 0 10px;

    .van-cell {
      padding: 10px 0;
    }

    .box-main {
      padding-bottom: 50px;
    }
  }
</style>
