const serviceURL = "http://192.168.0.80:84/api";
const fileURL = "http://192.168.0.80:84";
const servicePATH = {
  "getHomeContent" : serviceURL + "/getHomeContent",
  "getAddInfo": serviceURL + "/getAddInfo",  //定位接口
  "getRecommendCommodity": serviceURL + "/getRecommendCommodity",  //推荐商品接口
  "getPanicBuyTimeInfo": serviceURL + "/getPanicBuyTimeInfo",  //限时抢购接口
  "getMessageCenter": serviceURL + "/getMessageCenter",  //消息中心，
  "getCategorys": serviceURL + "/getCategorys",  //商品分类
  "getGoods": serviceURL + "/getGoods",  //商品列表
  "getGoodsInfo": serviceURL + "/getGoodsInfo",  //获取商品信息
  "getMyCartList": serviceURL + "/getMyCartList",  //获取购物车列表
  "getUserInfo": serviceURL + "/getUserInfo", //获取用户信息
  "getOrderCategory": serviceURL + "/getOrderCategory", //订单中心分类
  "getOrderListByCategory": serviceURL + "/getOrderListByCategory", //按照订单分类获取订单列表
};