//限时抢购
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/pages/home/index/panic_buy_goods_list.dart';
import 'package:provide/provide.dart';
import '../../../provide/home/panic_buy_provide.dart';
import '../../../model/home_model.dart';

// ignore: must_be_immutable
class PanicBuyWidget extends StatelessWidget {
  //const PanicBuyWidget({Key key}) : super(key: key);
  //PageView控制器，初始化页面为0 全局，时间跳转按钮要用到
  
  // PageController _pageController = PageController(
  //   initialPage: 0,
  // );
  @override
  Widget build(BuildContext context) {
    
    int code = Provide.value<PanicBuyProvide>(context).code;
    String message = Provide.value<PanicBuyProvide>(context).message;
    List<PanicBuyData> panicBuyData =
        Provide.value<PanicBuyProvide>(context).panicBuyData;
    
    PageController _pageController = PageController(
      initialPage: 0,
    );
    return Provide<PanicBuyProvide>(
      builder: (context, child, val) {
        //获取当前pageview索引
        int panicBuyCurrentIndex =
            Provide.value<PanicBuyProvide>(context).currentIndex;
        print("限时抢购PageView索引被改变:$panicBuyCurrentIndex");
        return Container(
          height: ScreenUtil().setHeight(752),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              //抢购时间按钮,传递当前索引
              _panicBuyStatus(context, panicBuyCurrentIndex, panicBuyData, _pageController),
              //抢购pageView,传递当前索引
              _panicBuyGoodsPageView(context, panicBuyCurrentIndex, _pageController),
              
            ],
          ),
        );
      },
    );
    
  }


  //购买状态切换
  Widget _panicBuyStatus(
      BuildContext context, int statusIndex, List<PanicBuyData> panicBuyData, PageController pageController) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      height: ScreenUtil().setHeight(133),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(79),
            color: Color.fromRGBO(247, 228, 207, 1),
            child: Row(
              
              children: panicBuyData.asMap().keys.map((key) {
                String state;
                bool isPanic;
                bool isPanic_a;
                switch (panicBuyData[key].state) {
                  case 0:
                    state = "已结束";
                    isPanic = false;
                    isPanic_a = statusIndex == key ? true : false;
                    break;
                  case 1:
                    state = "抢购进行中";
                    isPanic = true;
                    isPanic_a = statusIndex == key ? true : false;
                    Provide.value<PanicBuyProvide>(context).changeIndex(key);
                    break;
                  case 2:
                    state = "尚未开始";
                    isPanic = false;
                    isPanic_a = statusIndex == key ? true : false;
                    break;
                  default:
                }
                return InkWell(
                  
                  onTap: () {
                    //改变当前索引值
                    Provide.value<PanicBuyProvide>(context).changeIndex(key);
                    //使用page控制器进行跳转指定页面
                    pageController.jumpToPage(key);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(0),
                        top: ScreenUtil().setHeight(15)),
                    child: _timeListItem(
                        isPanic_a, panicBuyData[key].startTime, state),
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            left: ScreenUtil().setWidth(75) / 2,
            top: -45,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(241, 215, 174, 1),
              ),
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(54),
              child: Center(
                child: Text(
                  "限时抢购",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: Color.fromRGBO(194, 92, 29, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //时间列表
  Widget _timeListItem(bool isPanic, String time, String title) {
    return Column(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(70),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                fontWeight: isPanic ? FontWeight.w500 : FontWeight.normal,
                color: isPanic ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isPanic ? Colors.red : Colors.grey[400],
                fontSize: ScreenUtil().setSp(12),
                fontWeight: isPanic ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ),
        isPanic
            ? Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(3)),
                height: ScreenUtil().setHeight(3),
                width: ScreenUtil().setWidth(70),
                color: Colors.red,
              )
            : Container(),
      ],
    );
    
  }

  //抢购商品滚动视图
  Widget _panicBuyGoodsPageView(BuildContext context, int currentIndex, PageController pageController) {
    print(currentIndex);
    //print(_pageController.page.round());
    return Container(
      height: ScreenUtil().setWidth(578),
      child: PageView.builder(
        // ignore: missing_return
        //PageView页面
        itemBuilder: ((BuildContext context, int index) {
          return PanicBuyGoodsList(
            panicBuyCurrentIndex: index,
          );
        }),
        
        itemCount: 4,
        //横向滚动
        scrollDirection: Axis.horizontal,
        //pageview控制器
        controller: pageController,
        physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
        //页面索引发生变化
        onPageChanged: (index) {
          //赋值当前索引给状态管理
          Provide.value<PanicBuyProvide>(context).changeIndex(index);
        },
      ),
    );
  }
}
