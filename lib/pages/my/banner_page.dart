import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("点击了广告");
      },
      child: Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(5)),
        width: ScreenUtil().setWidth(368),
        height: ScreenUtil().setHeight(135),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage("assets/images/ucenter/u271.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
