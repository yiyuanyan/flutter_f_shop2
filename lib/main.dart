import 'package:flutter/material.dart';
import 'package:flutterfshop/pages/index_page.dart';
import 'package:flutterfshop/provide/cart/cart_provide.dart';
import 'package:flutterfshop/provide/home/home_provide.dart';
import 'package:flutterfshop/provide/home/message_provide.dart';
import 'package:flutterfshop/provide/home/panic_buy_provide.dart';
import 'package:flutterfshop/provide/home/recommend_commodity_provide.dart';
import 'package:flutterfshop/provide/mall/goods_provide.dart';
import 'package:flutterfshop/provide/mall/mall_provide.dart';
import 'package:flutterfshop/provide/my/my_add_provide.dart';
import 'package:flutterfshop/provide/my/my_provide.dart';
import 'package:flutterfshop/provide/my/order_provide.dart';
import 'provide/location/location_provide.dart';
import 'package:provide/provide.dart';
import 'package:fluro/fluro.dart';
import './routers/application.dart';
import './routers/routes.dart';

void main(){
  /* 路由管理 */
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  /* 状态管理 */
  var providers = Providers();

  var homeProvide = HomeProvide();
  var messageProvide = MessageProvide();
  var recommendCommodityProvide = RecommendCommodityProvide();
  var locationProvide = LocationProvide();
  var categoryProvide = CategoryProvide();
  var goodsProvide = GoodsProvide();
  var goodsInfoProvide = GoodsInfoProvide();
  var cartProvide = CartProvide();
  var myProvide = MyProvide();
  var myAddProvide = MyAddProvide();
  var orderProvide = OrderProvide();
  var panicBuyProvide = PanicBuyProvide();
  

  providers
  ..provide(Provider<LocationProvide>.value(locationProvide))
  ..provide(Provider<PanicBuyProvide>.value(panicBuyProvide))
  ..provide(Provider<MessageProvide>.value(messageProvide))
  ..provide(Provider<RecommendCommodityProvide>.value(recommendCommodityProvide))
  ..provide(Provider<CategoryProvide>.value(categoryProvide))
  ..provide(Provider<GoodsProvide>.value(goodsProvide))
  ..provide(Provider<GoodsInfoProvide>.value(goodsInfoProvide))
  ..provide(Provider<CartProvide>.value(cartProvide))
  ..provide(Provider<MyProvide>.value(myProvide))
    ..provide(Provider<MyAddProvide>.value(myAddProvide))
  ..provide(Provider<OrderProvide>.value(orderProvide))
  ..provide(Provider<HomeProvide>.value(homeProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      title: 'Flutter Demo',
      theme: ThemeData(
        highlightColor: Colors.white,
        splashColor: Colors.white,
      ),
      home: IndexPage(),
    );
  }
}
