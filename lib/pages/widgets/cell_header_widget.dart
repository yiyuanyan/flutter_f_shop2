import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CellHeaderWidget extends StatelessWidget {
  final String title;
  const CellHeaderWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(30),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setSp(5)),
      color: Colors.grey[300],
      child: Text(
        this.title,
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}