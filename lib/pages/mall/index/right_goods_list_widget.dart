import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/config/service_url.dart';
import 'package:flutterfshop/provide/mall/mall_provide.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:flutterfshop/service/service_method.dart';
import 'package:provide/provide.dart';
import '../../../model/mall_model.dart';

class RightGoodsListWidget extends StatefulWidget {
  RightGoodsListWidget({Key key}) : super(key: key);

  @override
  _RightGoodsListWidgetState createState() => _RightGoodsListWidgetState();
}

class _RightGoodsListWidgetState extends State<RightGoodsListWidget> {
  List<GoodsData> goodsData;

  @override
  Widget build(BuildContext context) {
    return Provide<GoodsProvide>(
      builder: (context, child, goodsModel) {
        print(goodsModel.goodsData.length);
        return Container(
          width: ScreenUtil().setWidth(285),
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
          color: Colors.white,
          child: Container(
            child: Column(
              children: <Widget>[
                _getFilterCriteria(),
                _getGoodsListView(context, goodsModel.goodsData),
              ],
            ),
          ),
        );
      },
    );
  }

  //搜索条件
  Widget _getFilterCriteria() {
    return Container(
      height: ScreenUtil().setHeight(35),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                print("综合");
              },
              child: Center(
                child: Text(
                  "综合",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                print("销量");
              },
              child: Center(
                child: Text(
                  "销量",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                print("筛选");
              },
              child: Center(
                child: Text(
                  "筛选",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //商品列表
  Widget _getGoodsListView(BuildContext context, List<GoodsData> goodsData) {
    print(goodsData.length);
    return Container(
      height: ScreenUtil().setHeight(442),
      child: ListView.builder(
        itemCount: goodsData.length,
        primary: false,
        itemExtent: ScreenUtil().setHeight(120),
        itemBuilder: (BuildContext context, index) =>
            _getGoodsListItem(context, index, goodsData),
      ),
    );
  }

  Widget _getGoodsListItem(BuildContext context, int index, List<GoodsData> goodsData) {
    // String imgURL = index % 2 == 0
    //     ? "assets/images/maill/u281.png"
    //     : "assets/images/maill/u1156.png";
    String imgURL = fileURL + goodsData[index].image;
    String goodsId = goodsData[index].id.toString();
    return InkWell(
      onTap: () {
        print("点击了第${index}的商品");
        Application.router.navigateTo(context, "/goodsInfo?goodsId={$goodsId}");
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(5),
            ),
            width: ScreenUtil().setWidth(285),
            height: ScreenUtil().setHeight(118),
            child: Row(
              children: <Widget>[
                //商品图片
                Image(
                  image: NetworkImage(imgURL),
                  width: ScreenUtil().setWidth(95),
                  height: ScreenUtil().setHeight(95),
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                  child: Column(
                    children: <Widget>[
                      //商品名称
                      Container(
                        alignment: Alignment.centerLeft,
                        width: ScreenUtil().setWidth(180),
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(12)),
                        child: Text(
                          //"黄色连衣裙",
                          goodsData[index].goodsName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                      ),
                      //商品简介
                      Container(
                        alignment: Alignment.centerLeft,
                        width: ScreenUtil().setWidth(180),
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        child: Text(
                          //"纯棉设计，很舒适",
                          goodsData[index].goodsDesc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: ScreenUtil().setWidth(180),
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                        child: Row(
                          children: <Widget>[
                            //秒杀标签
                            Container(
                              width: ScreenUtil().setWidth(67),
                              height: ScreenUtil().setHeight(20),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  //"限时秒杀",
                                  goodsData[index].goodsLabel,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(10),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            //抢购人数
                            Container(
                              width: ScreenUtil().setWidth(90),
                              margin:
                                  EdgeInsets.only(left: ScreenUtil().setSp(15)),
                              child: Text(
                                //"1000人已抢购",
                                goodsData[index].goodsOrder+"人已抢购",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(10),
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //商品价格
                      Container(
                        width: ScreenUtil().setWidth(180),
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                //"￥280.00",
                                goodsData[index].goodsPrice,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(10)),
                              child: Text(
                                //"￥750.00",
                                goodsData[index].goodsOldPrice,
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: ScreenUtil().setSp(10),
                                  color: Colors.grey[400],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.0, indent: 0.0, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
