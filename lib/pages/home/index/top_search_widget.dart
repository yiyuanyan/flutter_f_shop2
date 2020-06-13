import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';

class TopSearchWidget extends StatelessWidget {
  const TopSearchWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(40),
      padding: EdgeInsets.only(
        top: ScreenUtil().setSp(5),
        left: ScreenUtil().setSp(5),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, "/add?userId=555");
            },
            child: Image(
              image: AssetImage("assets/images/index/positions.png"),
              width: ScreenUtil().setWidth(15),
              height: ScreenUtil().setHeight(15),
              color: Color.fromRGBO(250, 140, 200, 1),
            ),
          ),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, "/add?userId=66666");
            },
            child: Text(
              "北京海淀区知春路",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(10),
              ),
            ),
          ),
          Image(
            image: AssetImage("assets/images/index/down_arrow.png"),
            width: ScreenUtil().setWidth(15),
            height: ScreenUtil().setHeight(15),
            color: Colors.grey[500],
          ),
          Expanded(
            flex: 12,
            child: InkWell(
              onTap: () {
                print("开始搜索");
              },
              child: Container(
                //color: Colors.red,
                margin: EdgeInsets.only(
                    left: ScreenUtil().setSp(5), right: ScreenUtil().setSp(10)),
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(25),
                //width: ScreenUtil().setWidth(225),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x33333333), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(12.5)),
                ),
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: ScreenUtil().setWidth(50),
                    maxWidth: ScreenUtil().setWidth(90),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/index/search.png"),
                        width: ScreenUtil().setWidth(15),
                        height: ScreenUtil().setHeight(15),
                        color: Colors.grey[400],
                      ),
                      Container(
                        width: 5,
                        height: 5,
                      ),
                      Text(
                        "搜索最美女装",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(10),
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, "/messagecenter?userId=888", transition: TransitionType.inFromRight);
              
              print("点击消息按钮");
            },
            child: Container(
              width: ScreenUtil().setWidth(30),
              height: ScreenUtil().setHeight(30),
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/index/u514-1.png"),
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setHeight(30),
                  ),
                  Positioned(
                    top: 2,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(211, 107, 190, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 8,
                        minHeight: 8,
                      ),
                      child: Text(
                        "10",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(6),
                        ),
                        textAlign: TextAlign.center,
                      ),
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
