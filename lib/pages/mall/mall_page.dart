import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/mall/index/left_category_list_widget.dart';
import 'package:flutterfshop/pages/mall/index/right_goods_list_widget.dart';
import 'package:flutterfshop/pages/mall/index/top_search_widget.dart';
import 'package:flutterfshop/provide/mall/mall_provide.dart';
import 'package:provide/provide.dart';

class MallPage extends StatelessWidget {
  const MallPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          alignment: Alignment.bottomCenter,
          width: ScreenUtil().setWidth(355),
          height: ScreenUtil().setHeight(30),
          child: Center(
            child: Text(
              "商城",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _getMallInfo(context, 0),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          
          if(snapshot.data == "true"){
            return Container(
              width: ScreenUtil().setWidth(375),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TopSearchWidget(),
                  _getGoodsListView(),
                ],
              ),
            );
          }else{
            return Container(
              child: Center(
                child: Text("网络开小差啦。。。"),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _getGoodsListView() {
    return Container(
      height: ScreenUtil().setHeight(482),
      child: Row(
        children: <Widget>[
          LeftCategoryListWidget(),
          RightGoodsListWidget(),
        ],
      ),
    );
  }

  Future<String> _getMallInfo(BuildContext context, int category_id) async{
    await Provide.value<CategoryProvide>(context).getCategorys();
    int cateCode = Provide.value<CategoryProvide>(context).code;
    await Provide.value<GoodsProvide>(context).getGoods(0);
    int goodsCode = Provide.value<GoodsProvide>(context).code;
    if(cateCode == 200 && goodsCode == 200){
      return "true";
    }else{
      return "false";
    }

    
  }
}
