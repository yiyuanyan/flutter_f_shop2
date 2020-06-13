//限时抢购商品列表页面
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanicBuyGoodsList extends StatelessWidget {
  final int panicBuyCurrentIndex;
  const PanicBuyGoodsList({Key key, this.panicBuyCurrentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color goodColor;
    switch (this.panicBuyCurrentIndex) {
      case 0:
        goodColor = Colors.white;
        break;
      case 1:
        goodColor = Colors.greenAccent;
        break;
      case 2:
        goodColor = Colors.green;
        break;
      case 3:
        goodColor = Colors.grey;
        break;
      default:
    }
    return Container(
      color: goodColor,
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      height: ScreenUtil().setHeight(580),
      width: ScreenUtil().setWidth(375),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return _goodsListItem(index);
        },
        itemCount: 4,
      ),
    );
  }

  Widget _goodsListItem(int index){

    String imageName = (index%2) > 0 ? "assets/images/index/u337.png" : "assets/images/index/u314.png";
    return InkWell(
      onTap: (){
        print("点击了限时抢购商品$index");
      },
      child: Container(
        //color: Colors.red,
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
        height: ScreenUtil().setHeight(134),
        child: Row(
          children: <Widget>[
            //商品图片
            Column(
              children: <Widget>[
                Image(image: AssetImage(imageName), width: ScreenUtil().setWidth(126),),
              ],
            ),
            //分割线
            Container(
              width: ScreenUtil().setWidth(5),
            ),
            //商品信息
            Container(
              color: Colors.white,
              width: ScreenUtil().setWidth(234),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "美恩女款跑步鞋",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.grey[666],
                    ),
                  ),
                  Text(
                    "领劵再减20 到手价68元",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.red,
                    ),
                  ),
                  //分割线
                  Container(
                    height: ScreenUtil().setHeight(5),
                  ),
                  //进度条
                  _customProgress("60"),
                  //价格与购买按钮
                  _priceAndButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //进度条
  Widget _customProgress(String progress){
    return Stack(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(18),
          width: ScreenUtil().setWidth(152),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Color.fromRGBO(249, 241, 232, 1),
              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(244, 207, 140, 1)),
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(18),
          width: ScreenUtil().setWidth(152),
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(7)),
          alignment: Alignment.centerLeft,
          child: Text(
            "已抢100",
            style: TextStyle(
              color: Color.fromRGBO(249, 120, 81, 1),
              fontSize: ScreenUtil().setSp(10),
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(18),
          width: ScreenUtil().setWidth(152),
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
          alignment: Alignment.centerRight,
          child: Text(
            "80%",
            style: TextStyle(
              color: Color.fromRGBO(249, 120, 81, 1),
              fontSize: ScreenUtil().setSp(10),
            ),
          ),
        ),
      ],
    );
  }
  //价格与购买按钮
  Widget _priceAndButton(){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
      width: ScreenUtil().setWidth(234),
      height: ScreenUtil().setHeight(35),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //价格
          Center(
            child: Text(
              "￥500",
              style: TextStyle(
                color: Colors.red,
                decorationColor: Colors.grey[400],
                fontSize: ScreenUtil().setSp(12),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Center(
              child: Text(
                "￥10000",
                style: TextStyle(
                  color: Colors.grey[400],
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey[400],
                  fontSize: ScreenUtil().setSp(10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(),
          ),
          InkWell(
            onTap: (){
              print("去抢购");
            },
            child: Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
              height: ScreenUtil().setHeight(35),
              width: ScreenUtil().setWidth(96),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Color.fromRGBO(226, 113, 116, 1),
              ),
              child: Center(
                child: Text(
                  "去抢购",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
