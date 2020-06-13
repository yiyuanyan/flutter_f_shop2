import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSearchWidget extends StatelessWidget {
  const TopSearchWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("点击了商城搜索框");
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(5)),
        child: Container(
          width: ScreenUtil().setWidth(347),
          height: ScreenUtil().setHeight(31),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(75),
              child: Row(
                children: <Widget>[
                  Image.asset("assets/images/maill/u1600.png"),
                  Container(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    "搜索商品",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(11),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
