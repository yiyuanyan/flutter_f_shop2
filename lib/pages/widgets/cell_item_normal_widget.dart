import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellItemNormalWidget extends StatelessWidget {
  final String title;
  const CellItemNormalWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("啊啊啊啊啊");
      },
      child: Container(
        height: ScreenUtil().setHeight(35),
        // color: Colors.red,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
        child: Text(
          this.title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(12),
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
