import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';
class MyServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(5), bottom: ScreenUtil().setHeight(5)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(365),
      height: ScreenUtil().setHeight(230),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          _myServiceTitle(),
          _myServiceGridView(context),
        ],
      ),
    );
  }
  //title
  Widget _myServiceTitle(){
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(25),
      child: Text(
        "我的服务",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          color: Colors.grey[600],
        ),
      ),
    );
  }
  //我的服务
  Widget _myServiceGridView(BuildContext context){
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: ScreenUtil().setWidth(70),
      mainAxisSpacing: ScreenUtil().setHeight(15),
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      childAspectRatio: 0.9,
      shrinkWrap: true,
      children: <Widget>[
        InkWell(
          onTap: (){
            print("点击了我的拼团");
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(8),
                ),
                Image(
                  image: AssetImage("assets/images/ucenter/group_buy.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                ),
                Text(
                  "我的拼团",
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
            Application.router.navigateTo(context, "/myAdd?user_id=1");
            print("点击了收货地址");
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(8),
                ),
                Image(
                  image: AssetImage("assets/images/ucenter/address.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                ),
                Text(
                  "收货地址",
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
            print("点击了客服咨询");
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(8),
                ),
                Image(
                  image: AssetImage("assets/images/ucenter/service.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                ),
                Text(
                  "客服咨询",
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
            print("点击了消息中心");
          },
          child: Container(
            alignment: Alignment.center,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(8),
                ),
                Image(
                  image: AssetImage("assets/images/ucenter/message.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                ),
                Text(
                  "消息中心",
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
            print("点击了意见反馈");
          },
          child: Container(
            alignment: Alignment.center,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(8),
                ),
                Image(
                  image: AssetImage("assets/images/ucenter/feedback.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                ),
                Text(
                  "意见反馈",
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
            print("点击了设置");
          },
          child: Container(
            alignment: Alignment.center,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(8),
                ),
                Image(
                  image: AssetImage("assets/images/ucenter/setting.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                ),
                Text(
                  "设置",
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
    );
  }
}
