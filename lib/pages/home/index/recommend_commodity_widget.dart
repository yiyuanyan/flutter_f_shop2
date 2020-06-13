//首页推荐商品
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';
import '../../../model/home_model.dart';
import 'package:flutterfshop/provide/home/recommend_commodity_provide.dart';
import 'package:provide/provide.dart';
import '../../../config/service_url.dart';

class RecommendCommodityWidget extends StatelessWidget {
  const RecommendCommodityWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int statCode =
        Provide.value<RecommendCommodityProvide>(context).statCode; //状态码
    String message =
        Provide.value<RecommendCommodityProvide>(context).message; //服务器返回的消息
    List<Data> r_data =
        Provide.value<RecommendCommodityProvide>(context).data; //服务器返回的数据
    print(message);
    return Container(
      height: ScreenUtil().setHeight(186),
      width: ScreenUtil().setWidth(836),
      color: Colors.white,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(5), top: ScreenUtil().setHeight(10)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: r_data.length,
        itemBuilder: (context, index) {
          return _commodityList(context,index, r_data);
        },
      ),
    );
  }

  Widget _commodityList(BuildContext context,int index, List<Data> r_data) {
    double right_spacing = index == 5 ? 0 : 30;
    return InkWell(
      onTap: () {
        String goodsId = r_data[index].id.toString();
        print("点击了推荐商品ID为"+r_data[index].id.toString()+"的商品");
        Application.router.navigateTo(context, "/goodsInfo?goodsId=$goodsId");
      },
      child: Container(
        width: ScreenUtil().setWidth(113),
        margin: EdgeInsets.only(right: right_spacing),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // Image(
            //   image: NetworkImage("$fileURL"+r_data[index].image),
            //   width: ScreenUtil().setWidth(113),
            //   height: ScreenUtil().setHeight(104),
            // ),
            Image.network(
              "$fileURL" + r_data[index].image,
              width: ScreenUtil().setWidth(113),
              height: ScreenUtil().setHeight(104),
              fit: BoxFit.fitWidth,
            ),
            Text(
              r_data[index].name,
              maxLines: 2,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "￥" + r_data[index].price,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(10), color: Colors.red),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(3),
                      left: ScreenUtil().setWidth(5)),
                  child: Text(
                    "￥" + r_data[index].oldPrice,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(9),
                      color: Colors.grey[500],
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
