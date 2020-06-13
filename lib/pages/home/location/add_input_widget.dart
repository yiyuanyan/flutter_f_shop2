import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInputWidget extends StatelessWidget {
  const AddInputWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setWidth(5),
            bottom: ScreenUtil().setWidth(5),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20)),
        height: ScreenUtil().setHeight(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 1, color: Colors.grey[400]),
        ),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                print("选择城市");
              },
              child: Container(
                padding: EdgeInsets.only(left: 12),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "上海市",
                      ),
                      Image(
                        image: AssetImage("assets/images/index/down_arrow.png"),
                        width: ScreenUtil().setWidth(15),
                        height: ScreenUtil().setHeight(15),
                        color: Colors.grey[500],
                      ),
                      Container(
                          height: 15,
                          child: VerticalDivider(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: ScreenUtil().setWidth(250),
                  minWidth: ScreenUtil().setWidth(100),
                ),
                child: Center(
                  child: Text(
                    "请输入您的收货地址",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
