module.exports = {
  devServer: {
    // 修改项目端口号
    port: 8080,
    // 跨域问题-代理
    proxy: {
      '/api': {
        target: 'http://localhost:8000',
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    }
  }
}
