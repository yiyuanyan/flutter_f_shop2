import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/my/banner_page.dart';
import 'package:flutterfshop/pages/my/my_service_page.dart';
import 'package:flutterfshop/pages/my/order_center_page.dart';
import 'package:flutterfshop/pages/my/user_info_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "我的",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.amber,
        child: ListView(
          children: <Widget>[
            UserInfoPage(),
            OrderCenterPage(),
            BannerPage(),
            MyServicePage(),
          ],
        ),
      ),
    );
  }

}