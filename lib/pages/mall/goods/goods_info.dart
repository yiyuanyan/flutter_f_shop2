import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterfshop/provide/mall/goods_provide.dart';
import 'package:provide/provide.dart';
import 'package:webview_flutter/webview_flutter.dart';
class GoodsInfo extends StatelessWidget {
  final String goodsId;

  const GoodsInfo({Key key, this.goodsId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WebViewController _webViewController;
    print(this.goodsId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.grey[500],
          icon: Icon(Icons.navigate_before),
          onPressed: (){
            Application.router.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Container(
          width: ScreenUtil().setWidth(245),
          alignment: Alignment.center,
          child: Text(
            "商品详细信息",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
      ),
//      body: FutureBuilder(
//          future: _getGoodsInfo(context, this.goodsId),
//          // ignore: missing_return
//          builder: (context, snapshot){
//            if(snapshot.hasData){
//              String data = Provide.value<GoodsInfoProvide>(context).goodsData.toString();
//              return Html(
//                data: data,
//
//              );
//            }else{
//              return Container(
//                child: Center(
//                  child: Text("正在读取网页"),
//                ),
//              );
//            }
//          },
//      ),
      body: WebView(
        initialUrl: 'https://item.m.jd.com/product/69551658850.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  Future<String> _getGoodsInfo(BuildContext context, String goodsId) async{
    await Provide.value<GoodsInfoProvide>(context).getGoodsInfo(goodsId);
    return "OK";
  }
}



