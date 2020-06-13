import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/widgets/cell_header_widget.dart';
import 'package:flutterfshop/pages/widgets/cell_item_icon_widget.dart';
import 'package:flutterfshop/provide/location/location_provide.dart';
import 'package:provide/provide.dart';
/*
送至ListView
*/
class ListViewArrive extends StatelessWidget {
  const ListViewArrive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String current_add=Provide.value<LocationProvide>(context).currentAdd;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: CellHeaderWidget(title: "送至",),
          ),
          Container(
            child: CellItemIconWidget(
              icon: AssetImage("assets/images/index/positions.png"),
              community: current_add,
              explain: "当前定位",
              sub_icon: AssetImage("assets/images/index/refresh.png"),
              sub_explain: "重新定位",
            ),
          )
        ],
      ),
    );
  }
}