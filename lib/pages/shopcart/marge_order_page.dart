import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//凑单
class MargeOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              "购物满1299元，可减50元",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Colors.grey[600],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              print("点击了去凑单");
            },
            child: Container(
              child: Text(
                "去凑单 >",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.pinkAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
