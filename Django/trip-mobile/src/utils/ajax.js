import axios from 'axios'

export const ajax = axios.create({
  // 设置自定义请求头
  headers: {
    source: 'h5',
    'Content-Type': 'application/x-www-form-urlencoded'
  },
  // 默认加载上一次cookie
  withCredentials: true
})
// 请求拦截
ajax.interceptors.request.use(function (config) {
  console.log('请求已拦截')
  return config
}), function (error) {
  return Promise.reject(error)
}
// 响应拦截
ajax.interceptors.response.use(function (response) {
  console.log('响应已拦截')
  return response
}), function (error) {
  // 统一错误处理
  if (error.response.status === 401) {
    window.alert('未登录，即将跳转至登录页面')
  } else if (error.response.status === 500 || error.response.status === 504) {
    window.alert('服务器正忙，请稍后重试')
  } else if (error.response.status === 400) {
    window.alert('参数错误提示')
  }
  return Promise.reject(error)
}
