import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCellHeader extends StatelessWidget {
  const ListCellHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: _cellHeader("送至"),
          ),
          Container(
            child: _cellItemTypeOne(),
          )
        ],
      ),
    );
  }

  //CellHeader
  Widget _cellHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(30),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setSp(5)),
      color: Colors.grey[300],
      child: Text(
        "送至",
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  //CellItem 图标+文字 + 横向副标题 + 图标+末尾子标题
  Widget _cellItemTypeOne() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(30),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
           Container(
            width: ScreenUtil().setWidth(10),
          ),
          Image(
            image: AssetImage("assets/images/index/positions.png"),
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
              "美丽小区",
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
              "当前定位",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(8),
                color: Colors.grey[600],
              ),
            ),
          ),
          Image(
            image: AssetImage("assets/images/index/refresh.png"),
            width: ScreenUtil().setWidth(15),
            height: ScreenUtil().setHeight(15),
            color: Color.fromRGBO(250, 140, 200, 1),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
            child: Text(
              "重新定位",
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
