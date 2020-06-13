import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanicBuyGoods extends StatelessWidget {
  final int pageCurrentIndex;
  const PanicBuyGoods({Key key, this.pageCurrentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("第${pageCurrentIndex}页商品列表"),
    );
  }
}
