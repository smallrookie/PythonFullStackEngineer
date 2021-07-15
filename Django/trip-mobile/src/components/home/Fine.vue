<template>
  <!-- 首页精选景点 -->
  <div class="home-fine-box">
    <!--  顶部导航  -->
    <van-cell title="精选景点" icon="location-o" title-style="text-align:left" value="更多" is-link />
    <!--  // 顶部导航  -->
    <!-- 景点列表 -->
    <div class="box-main">
      <a href="#" class="sight-item" v-for="item in dataList" :key="item.id">
        <img src="/static/home/hot/h1.jpg" alt="">
        <div class="right">
          <h5>{{item.name}}</h5>
          <van-rate v-model="item.score" readonly />
          <div class="tips">4人点评 | 100%满意</div>
          <div class="tips light">广东-广州</div>
          <div class="line-price">￥ {{item.price}} 起</div>
        </div>
      </a>
    </div>
    <!-- // 景点列表 -->
  </div>
</template>
<script>
export default {
  data () {
    return {
      dataList: [{
        id: 1,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 2,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 3,
        name: '景点名称',
        score: 3,
        price: 98
      },
      {
        id: 4,
        name: '景点名称',
        score: 5,
        price: 98
      },
      {
        id: 5,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 6,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 7,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 8,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 9,
        name: '景点名称',
        score: 4.5,
        price: 98
      },
      {
        id: 10,
        name: '景点名称',
        score: 4.5,
        price: 98
      }
      ]
    }
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
      .sight-item {
        display: flex;
        margin-top: 10px;
        border-bottom: 1px solid #f6f6f6;

        img {
          width: 100px;
          height: 100px;
        }

        h5 {
          color: #212121;
          font-size: 14px;
          margin: 0;
          padding: 5px 0;
        }

        .right {
          flex-grow: 1;
          text-align: left;
          justify-content: left;
          padding-left: 5px;
          position: relative;
        }

        .line-price {
          position: absolute;
          right: 10px;
          top: 20px;
          display: inline-block;
          color: #f50;
          font-size: 16px;
          font-weight: bold;
        }

        .tips {
          font-size: 12px;
          color: #666;

          &.light {
            color: #999;
          }
        }
      }
    }
  }
</style>
