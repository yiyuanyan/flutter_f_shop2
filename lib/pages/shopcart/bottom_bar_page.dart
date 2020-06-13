import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';
//购物车结算按钮
class BottomBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(50),
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: ScreenUtil().setWidth(80),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Checkbox(
                  value: true,
                  activeColor: Colors.pinkAccent,
                  onChanged: (bool val){
                    print("全选");
                  },
                ),
                Positioned(
                  left: ScreenUtil().setWidth(38),
                  child: Text("全选"),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Text(
                  "合计:",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "￥0.00",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: MaterialButton(
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              textColor: Colors.white,
              child: Text(
                "去结算",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                print("点击了去结算按钮");
                Application.router.navigateTo(context, "/orderInfo?orderKey=2");
              },
            ),
          ),

        ],
      ),
    );
  }
}
