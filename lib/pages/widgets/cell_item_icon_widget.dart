import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellItemIconWidget extends StatelessWidget {
  final ImageProvider icon;  //主图标
  final String community;  //小区
  final String explain;  //说明
  final ImageProvider sub_icon;
  final String sub_explain; //副说明
  const CellItemIconWidget({Key key, this.icon, this.community, this.explain, this.sub_icon, this.sub_explain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(38),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(10),
          ),
          Image(
            image: this.icon,
            width: ScreenUtil().setWidth(15),
            height: ScreenUtil().setHeight(15),
            color: Color.fromRGBO(250, 140, 200, 1),
          ),
          Container(
            width: ScreenUtil().setWidth(5),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: ScreenUtil().setWidth(230),
            ),
            child: Text(
              this.community,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Colors.grey[800],
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(10),
          ),
          Expanded(
            flex: 1,
            child: Text(
              this.explain,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(8),
                color: Colors.grey[600],
              ),
            ),
          ),
          Image(
            image: this.sub_icon,
            width: ScreenUtil().setWidth(15),
            height: ScreenUtil().setHeight(15),
            color: Color.fromRGBO(250, 140, 200, 1),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
            child: Text(
              this.sub_explain,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(8),
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
