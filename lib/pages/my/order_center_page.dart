import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          _orderTitle(),
          //分割线
          Container(
            width: ScreenUtil().setWidth(365),
            height: ScreenUtil().setHeight(1),
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  //订单title
  Widget _orderTitle(){
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


}
