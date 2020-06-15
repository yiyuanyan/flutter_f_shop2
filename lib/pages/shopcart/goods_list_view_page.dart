import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/model/cart_model.dart';
import 'package:flutterfshop/pages/shopcart/goods_item_page.dart';
import 'package:flutterfshop/provide/cart/cart_provide.dart';
import 'package:provide/provide.dart';
// 订单列表
class GoodsListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMyCartList(context, "1"),
      // ignore: missing_return
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<CartInfo> cartInfo = Provide.value<CartProvide>(context).cartInfo;
          return Provide<CartProvide>(
            builder: (context, child, value){
              return Container(
                width: ScreenUtil().setWidth(375),
                height: ScreenUtil().setHeight(433),
                child: ListView.builder(
                  itemCount: cartInfo.length,
                  // ignore: missing_return
                  itemBuilder: (BuildContext context, index){
                    return GoodsItemPage(cartInfo: cartInfo[index], index: index,);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<String> _getMyCartList(BuildContext context, String user_id) async{
    await Provide.value<CartProvide>(context).getCartList(user_id);
    return "OK";
  }
}
