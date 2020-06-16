import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(190),
      child: Stack(
        //alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(375),
            color: Colors.redAccent,
            height: ScreenUtil().setHeight(147),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //用户头像
                  _userHeader(),
                  //用户名称
                  Expanded(
                    flex: 2,
                    child: _userName(),
                  ),
                  //邀请按钮
                  _invitationBtn(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 10,
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(5),right: ScreenUtil().setWidth(5)),
              width: ScreenUtil().setWidth(365),
              height: ScreenUtil().setHeight(80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              //用户状态
              child: _userStatus(),
            ),
          ),
        ],
      ),
    );
  }

  //用户头像
  Widget _userHeader(){
    return InkWell(
      onTap: (){
        print("点击了头像");
      },
      child: Container(
        width: ScreenUtil().setWidth(75),
        height: ScreenUtil().setHeight(75),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(37.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/maill/u281.png"),
          ),
        ),
      ),
    );
  }

  //用户名称
  Widget _userName(){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10), top: ScreenUtil().setHeight(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "寒冰小贱贱",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: Colors.white,
            ),
          ),
          Text(
            "ID: 37507963",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //用户邀请按钮
  Widget _invitationBtn(){
    return InkWell(
      onTap: (){
        print("点击了邀请按钮");
      },
      child: Container(
        width: ScreenUtil().setWidth(70),
        height: ScreenUtil().setHeight(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            "邀请有礼",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: Colors.purpleAccent,
            ),
          ),
        ),
      ),
    );
  }

  //用户状态
  Widget _userStatus(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //余额
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
          width: ScreenUtil().setWidth(90),
          height: ScreenUtil().setHeight(80),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "￥3578.00",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "余额",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        //分割线
        Container(
          width: ScreenUtil().setWidth(1),
          height: ScreenUtil().setHeight(28),
          color: Colors.grey[400],
        ),
        //红包
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
          width: ScreenUtil().setWidth(90),
          height: ScreenUtil().setHeight(80),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "￥300.00",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "红包",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        //分割线
        Container(
          width: ScreenUtil().setWidth(1),
          height: ScreenUtil().setHeight(28),
          color: Colors.grey[400],
        ),
        //优惠券
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
          width: ScreenUtil().setWidth(90),
          height: ScreenUtil().setHeight(80),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "3张",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "优惠券",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        //分割线
        Container(
          width: ScreenUtil().setWidth(1),
          height: ScreenUtil().setHeight(28),
          color: Colors.grey[400],
        ),
        //积分
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
          width: ScreenUtil().setWidth(90),
          height: ScreenUtil().setHeight(80),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  "100分",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "积分",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
