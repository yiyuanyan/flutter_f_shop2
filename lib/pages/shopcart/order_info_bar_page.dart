import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//支付底部bar
class OrderInfoBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5),
      height: ScreenUtil().setHeight(60),
      width: ScreenUtil().setWidth(375),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey[300],
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Text(
            "付款",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              color: Colors.grey[600],
            ),
          ),
          //间隔
          Container(width: ScreenUtil().setWidth(5),),
          //合计总价
          Expanded(
            flex: 1,
            child: Text(
              "￥27800.00",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.red,
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){
              print("点击了去支付");
            },

            color: Colors.pink,
            highlightColor: Colors.pink,
            textColor: Colors.white,
            child: Text(
              "去支付",
              style: TextStyle(

              ),
            ),
          ),
        ],
      ),
    );
  }
}
