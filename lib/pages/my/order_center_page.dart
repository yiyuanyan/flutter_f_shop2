import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';

class OrderCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(5)),
      width: ScreenUtil().setWidth(365),
      height: ScreenUtil().setHeight(130),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          //订单title
          _orderTitle(context),
          //分割线
          Container(
            width: ScreenUtil().setWidth(365),
            height: ScreenUtil().setHeight(1),
            color: Colors.grey[400],
          ),
          //货运列表
          _freightGridView(),

        ],
      ),
    );
  }

  //订单title
  Widget _orderTitle(BuildContext context){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(5)),
      width: ScreenUtil().setWidth(365),
      height: ScreenUtil().setHeight(45),
      child: Row(
        children: <Widget>[
          Text(
            "订单中心",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: Colors.grey[600],
            ),
          ),
          Expanded(child: Container(), flex: 2,),
          InkWell(
            onTap: (){
              print("点击了查看更多按钮");
              Application.router.navigateTo(context, "/orderList?orderListKey=1");
            },
            child: Text(
              "查看更多 >",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.purple,
              ),
            ),
          ),

        ],
      ),
    );
  }
  //货运列表
  Widget _freightGridView(){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setHeight(5),top: ScreenUtil().setHeight(10)),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        crossAxisSpacing: 35,
        childAspectRatio: 0.8,
        shrinkWrap: true,
        children: <Widget>[
          InkWell(
            onTap: (){
              print("点击了待付款");
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/ucenter/wait_payment.png"), width: ScreenUtil().setWidth(35), height: ScreenUtil().setHeight(35),),
                  Text(
                    "待付款",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print("点击了待发货");
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/ucenter/wait_delivered.png"), width: ScreenUtil().setWidth(35), height: ScreenUtil().setHeight(35),),
                  Text(
                    "待发货",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print("点击了待收货");
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/ucenter/wait_receipt.png"), width: ScreenUtil().setWidth(35), height: ScreenUtil().setHeight(35),),
                  Text(
                    "待收货",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print("点击了待评价");
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/ucenter/evaluate.png"), width: ScreenUtil().setWidth(35), height: ScreenUtil().setHeight(35),),
                  Text(
                    "待评价",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print("点击了已取消");
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/ucenter/cancel.png"), width: ScreenUtil().setWidth(35), height: ScreenUtil().setHeight(35),),
                  Text(
                    "已取消",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
