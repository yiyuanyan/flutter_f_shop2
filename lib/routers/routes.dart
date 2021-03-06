import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import './router_handler.dart';

class Routes{
  static String root="/";

  static String addPage="/add";
  static String newUser="/newuser";
  static String messageCenter = "/messagecenter";
  static String goodsInfo = "/goodsInfo";
  static String orderInfo = "/orderInfo";
  static String orderList = "/orderList";
  static String myAdd = "/myAdd";
  static String newAdd = "/newAdd";
  static String myInformation = "/myInformation";
  static void configureRoutes(Router router){
    //判断是否匹配到路由
    router.notFoundHandler = Handler(
      // ignore: missing_return
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print("没有匹配到相应路由");
      }
    );
    router.define(addPage, handler: AddHandler);
    router.define(newUser, handler: NewUserHandler);
    router.define(messageCenter, handler: MessageCenterHandler);
    router.define(goodsInfo, handler: GoodsInfoHandler);
    router.define(orderInfo, handler: OrderInfoHandler);
    router.define(orderList, handler: OrderListHandler);
    router.define(myAdd, handler: MyAddHandler);
    router.define(newAdd, handler: NewAddHandler);
    router.define(myInformation, handler: MyInformationHandler);
  }
}