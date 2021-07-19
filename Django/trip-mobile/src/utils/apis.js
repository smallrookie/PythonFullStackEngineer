/**
 * 存放项目中所有的接口地址
 */

const apiHost = 'http://localhost:8080/api/'

// 系统模块接口
const SystemApis = {
  sliderListUrl: apiHost + 'system/slider/list/'
}

// 景点接口模块
const SightApis = {
  sliderListUrl: apiHost + 'sight/sight/list/'
}

export {
  SystemApis,
  SightApis
}
