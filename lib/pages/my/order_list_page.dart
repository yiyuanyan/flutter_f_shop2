//订单中心
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderListPage extends StatelessWidget {
  final String orderListKey;

  const OrderListPage({Key key, this.orderListKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "订单中心",
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
      ),
      body: _orderListView(),
    );
  }
  //订单列表
  Widget _orderListView(){
    return Container(
      child: ListView(
        children: <Widget>[
          _orderCartgory(),
        ],
      ),
    );
  }
  //订单分类
  Widget _orderCartgory(){
    return Container(
      height: ScreenUtil().setHeight(30),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: ScreenUtil().setWidth(10),
        childAspectRatio: 2.0,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(25),
            color: Colors.purple,
            child: Text(
              "全部",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
          Container(

            height: ScreenUtil().setHeight(25),
            color: Colors.purple,
            child: Center(
              child: Text(
                "全部",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
