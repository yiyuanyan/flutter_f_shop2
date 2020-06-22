import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutterfshop/pages/mall/goods/goods_info.dart';
import 'package:flutterfshop/pages/my/my_add_page.dart';
import 'package:flutterfshop/pages/my/my_information_page.dart';
import 'package:flutterfshop/pages/my/new_add_page.dart';
import 'package:flutterfshop/pages/my/order_list_page.dart';
import 'package:flutterfshop/pages/shopcart/order_info_page.dart';

import '../pages/home/location/add_page.dart';  //收货地址页面
import '../pages/home/newuser/new_user_gridview.dart';
import '../pages/home/message/message_center_widget.dart';  //消息中心

//根目录
//监听收货地址页面路由
var AddHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String userId = params["userId"].first;
    print("${userId}");
    return AddPage(userId: userId);
  }
);

var NewUserHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String userId = params["userId"].first;
    return NewUserGridView(userId: userId,);
  }
);

var MessageCenterHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String userId = params["userId"].first;
    return MessageCenterWidget(userId: userId,);
  }
);

var GoodsInfoHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String goodsId = params["goodsId"].first;
    return GoodsInfo(goodsId: goodsId);
  }
);

var OrderInfoHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String orderKey = params["orderKey"].first;
    return OrderInfoPage(orderKey: orderKey,);
  }
);

var OrderListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String orderListKey = params["orderListKey"].first;
    return OrderListPage(orderListKey: orderListKey);
  }
);

var MyAddHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String user_id = params["user_id"].first;
    return MyAddPage(user_id: user_id,);
  }
);

var NewAddHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String user_id = params["user_id"].first;
    return NewAddPage(user_id: user_id,);
  }
);

var MyInformationHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String user_id = params["user_id"].first;
    return MyInformationPage(user_id: user_id,);
  }
);