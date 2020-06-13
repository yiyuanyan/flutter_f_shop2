import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/shopcart/bottom_bar_page.dart';
import 'package:flutterfshop/pages/shopcart/goods_list_view_page.dart';
import 'package:flutterfshop/pages/shopcart/marge_order_page.dart';
//购物车主页面
class ShopCartPage extends StatelessWidget {
  const ShopCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.bottomCenter,
          height: ScreenUtil().setHeight(30),
          width: ScreenUtil().setWidth(355),
          child: Center(
            child: Text(
              "购物车",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: ScreenUtil().setWidth(375),
        height: ScreenUtil().setHeight(514),
        //color: Colors.green,
        child: Column(
            children: <Widget>[
              MargeOrderPage(),
              GoodsListViewPage(),
              BottomBarPage(),
            ],
        ),
      ),
    );
  }
}