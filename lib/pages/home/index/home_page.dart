import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/provide/home/panic_buy_provide.dart';
import 'package:flutterfshop/provide/home/recommend_commodity_provide.dart';
import './category_grid_widget.dart';
import 'package:flutterfshop/pages/home/index/events_banner_widget.dart';
import './goods_list.dart';
import './new_user_widget.dart';
import 'package:flutterfshop/pages/home/index/panic_buy_widget.dart';
import './recommend_commodity_widget.dart';
import './swiper_widget.dart';
import 'package:flutterfshop/pages/home/index/top_search_widget.dart';
import 'package:provide/provide.dart';
import '../../../provide/home/home_provide.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getHomeContent(context),
      // ignore: missing_return
      builder: (context, snapshot){
        // ignore: missing_return
        if(snapshot.hasData){
          return Stack(
            children: <Widget>[
              Container(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    //顶部搜索
                    TopSearchWidget(),
                    //轮播图
                    SwiperWidget(),
                    //新用户专享
                    NewUserWidget(),
                    //分类列表
                    CategoryGridWidget(),
                    //中部广告banner
                    EventsBannerWidget(),
                    RecommendCommodityWidget(),
                    //分割线
                    _dividingLine(ScreenUtil().setHeight(7), Colors.grey[300]),
                    //限时抢购
                    PanicBuyWidget(),
                    GoodsList(),
                  ],
                ),
              ),
            ],
          );
        }else{
          return Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              height: 44.0,
              width: 44.0,
            ),
          );
        }
      },
    );
  }
  Future<String> _getHomeContent(BuildContext context) async{
    await Provide.value<HomeProvide>(context).getHomeContent();
    int statCode = Provide.value<HomeProvide>(context).statCode;
    await Provide.value<RecommendCommodityProvide>(context)
        .getRecommendCommodityInfo();
    await Provide.value<PanicBuyProvide>(context).getPanicBuyTimeInfo();
    if(statCode == 200){
      return "OK";
    }else{
      //return "ERROR";
    }
    return "OK";
  }

  Widget _dividingLine(double height, Color color){
    return Container(
      height: height,
      color: color,
    );
  }
}