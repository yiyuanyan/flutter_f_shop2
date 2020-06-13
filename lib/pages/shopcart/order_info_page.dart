import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/shopcart/order_info_bar_page.dart';
import 'package:flutterfshop/pages/shopcart/order_info_listview_page.dart';
import 'package:flutterfshop/routers/application.dart';
//支付页面
class OrderInfoPage extends StatelessWidget {
  final String orderKey;

  const OrderInfoPage({Key key, this.orderKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.grey[500],
          icon: Icon(Icons.navigate_before),
          onPressed: (){
            Application.router.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Container(
          width: ScreenUtil().setWidth(245),
          alignment: Alignment.center,
          child: Text(
            "填写订单",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
      ),
      body: _orderInfoView(context),
    );
  }

  Widget _orderInfoView(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          OrderInfoListViewPage(),
          OrderInfoBarPage(),
        ],
      ),
    );
  }
}
