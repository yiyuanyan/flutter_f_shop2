import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/config/service_url.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:provide/provide.dart';
import '../../../model/home_model.dart';
import '../../../provide/home/home_provide.dart';
class NewUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewUser newUser = Provide.value<HomeProvide>(context).newUser;
    return Container(

      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      alignment: Alignment.center,

      height: ScreenUtil().setHeight(132),
      child: Column(
        children: <Widget>[
          //新用户特权
          Container(
            width: ScreenUtil().setWidth(370),
            height: ScreenUtil().setHeight(20),
//            color: Colors.yellow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: newUser.privilege.map((item){
                return Text(
                  item,
                  style: TextStyle(
                    color: Color.fromRGBO(250, 140, 200, 1),
                  ),
                );
              }).toList(),
            ),
          ),
          //新用户优惠广告
          InkWell(
            onTap: (){
              Application.router.navigateTo(context, "/newuser?userId=66666");
              print("点击了新人专享1111");
            },
            child: Container(
              width: ScreenUtil().setWidth(350),
              child: Image.network("${fileURL}${newUser.banner}"),
            ),
          ),
        ],
      ),
    );
  }
}
