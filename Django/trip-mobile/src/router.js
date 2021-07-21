import Vue from 'vue'
import VueRouter from 'vue-router'
import HomePage from './views/Home.vue'
import AboutPage from './views/About.vue'

// VueRouter插件化
Vue.use(VueRouter)

// 定义路由规则
const routes = [
  { path: '/home', component: HomePage },
  { path: '/about', component: AboutPage }
]

// 配置路由
const route = new VueRouter({
  routes
})

export default route
