//限时抢购
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterfshop/pages/home/index/panic_buy_goods_list.dart';
import './panic_buy_goods.dart';
import 'package:provide/provide.dart';
import '../../../provide/home/panic_buy_provide.dart';
import '../../../model/home_model.dart';

class PanicBuyWidget extends StatefulWidget {
  PanicBuyWidget({Key key}) : super(key: key);

  @override
  _PanicBuyWidgetState createState() => _PanicBuyWidgetState();
}

class _PanicBuyWidgetState extends State<PanicBuyWidget> {
  List<PanicBuyData> panicBuyData = [];
  int pageCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    this.panicBuyData = Provide.value<PanicBuyProvide>(context).panicBuyData;
    return Container(
      child: Column(
        children: <Widget>[
          getTimeWidget(),
          // PanicBuyGoods(
          //   pageCurrentIndex: this.pageCurrentIndex,
          // ),
          PanicBuyGoodsList(
            panicBuyCurrentIndex: this.pageCurrentIndex,
          ),
        ],
      ),
    );
  }

  Widget getTimeWidget(){
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(133),
      child: Stack(
        alignment: Alignment.bottomCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(375),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
            color: Color.fromRGBO(247, 228, 207, 1),
            alignment: Alignment.bottomCenter,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 2,
              children: getWidgetList(),
            ),
          ),
          Positioned(
            left: ScreenUtil().setWidth(75) / 2,
            top: 10,
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
  List<Widget> getWidgetList() {
    List<Widget> widgetList = [];
    for(int i=0; i<this.panicBuyData.length; i++){
      widgetList.add(
        getTimeItem(panicBuyData[i].startTime, panicBuyData[i].state, i)
      );
    }
    return widgetList;
  }

  //时间列表
  Widget getTimeItem(String time, int state, int key) {
    String stateString;
    bool isPanic;
    switch (state) {
      case 0:
        stateString = "已结束";
        //isPanic = false;
        break;
      case 1:
        stateString = "抢购进行中";
        //isPanic = true;
        break;
      case 2:
        stateString = "尚未开始";
        //isPanic = false;
        break;
      default:
    }
    if(this.pageCurrentIndex == key){
      isPanic = true;
    }else{
      isPanic = false;
    }
    return InkWell(
      onTap: () {
        print("点击了第{$key}的时间段按钮");
        setState(() {
          this.pageCurrentIndex = key;
        });
      },
      child: Container(
        child: Column(
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
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(6)),
              child: Center(
                child: Text(
                  stateString,
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
        ),
      ),
    );
  }
}
