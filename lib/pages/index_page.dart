import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home/index/home_page.dart';
import 'package:flutterfshop/pages/mall/mall_page.dart';
import 'package:flutterfshop/pages/my/my_page.dart';
import 'package:flutterfshop/pages/shopcart/shopcart_page.dart';
import 'package:provide/provide.dart';
import '../provide/home/home_provide.dart';
class IndexPage extends StatelessWidget {
  
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/index/u109.png")),
      title: Text("商城"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text("购物车"),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text("我的")
    )
  ];
  final List<Widget> tabBodies = [
    HomePage(),
    MallPage(),
    ShopCartPage(),
    MyPage(),
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    return Provide<HomeProvide>(
      builder: (context, child, val){
        int currentIndex = Provide.value<HomeProvide>(context).currentIndex;
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: items,
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            selectedItemColor: Color.fromRGBO(211, 107, 190, 1),
            selectedFontSize: ScreenUtil().setSp(11),
            onTap: (index){
              Provide.value<HomeProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}