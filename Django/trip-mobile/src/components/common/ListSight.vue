<template>
  <a href="#" class="sight-item">
    <img :src="item.main_img" :alt="item.name">
    <div class="right">
      <h5>{{item.name}}</h5>
      <van-rate v-model="item.score" readonly />
      <div class="tips">{{item.comment_count}}人点评 | 100%满意</div>
      <div class="tips light">{{item.province}}-广州</div>
      <div class="line-price">￥ {{item.min_price}} 起</div>
    </div>
  </a>
</template>
<script>
export default {
  props: ['item']
}
</script>
<style lang="less">
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
</style>
