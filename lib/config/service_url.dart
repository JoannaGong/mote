const serviceUrl = 'http://101.37.156.106/model_api/';
const servicePath = {
  'bannerForAjax': '${serviceUrl}bannerController/bannerForAjax', //banner
  'homeModuleForAjax': '${serviceUrl}homeModuleController/homeModuleForAjax', //首页导航模块
  'getmodelList':'${serviceUrl}userController/user',  //模特
  'getProductionList':'${serviceUrl}worksController/works',  //模特
  'getPhoneValid': '${serviceUrl}sendMessageController/sendMessage',  // 发送手机短信验证码
  'loginForPhone': '${serviceUrl}loginController/loginForPhone',   // 用手机登录
};
