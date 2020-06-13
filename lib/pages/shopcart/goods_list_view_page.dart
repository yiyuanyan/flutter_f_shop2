import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/shopcart/goods_item_page.dart';
// 订单列表
class GoodsListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(433),
      child: ListView.builder(
        itemCount: 7,
        // ignore: missing_return
        itemBuilder: (BuildContext context, index){
          return GoodsItemPage(index: index,);
        },
      ),
    );
  }
}
