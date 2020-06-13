import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsList extends StatelessWidget {
  const GoodsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _goodsBanner(),
          _goodsGridView(),
        ],
      ),
    );
  }
  //banner
  Widget _goodsBanner(){
    return Container(
      child: Image.asset(
        "assets/images/index/u236.png",
        width: ScreenUtil().setWidth(375),
        height: ScreenUtil().setHeight(142),
        fit: BoxFit.fitWidth,
      ),
    );
  }
  //商品列表
  Widget _goodsGridView(){
    return Container(
      width: ScreenUtil().setWidth(375),
      constraints: BoxConstraints(
        minHeight: ScreenUtil().setHeight(705),
      ),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
        shrinkWrap: true,
        children: _goodsItemList(),
      ),
    );
  }
  List<Widget> _goodsItemList(){
    List<Widget> items = List();
    for(int i=0;i<13;i++){
      items.add(
        InkWell(
          onTap: (){
            print("点击了第$i号商品");
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //商品图片
                Image.asset(
                  "assets/images/index/u125.png",
                  width: ScreenUtil().setWidth(172),
                  height: ScreenUtil().setHeight(163),
                  fit: BoxFit.fill,
                ),
                //商品名称
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                  width: ScreenUtil().setWidth(150),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "蓝色蕾丝修身显瘦蓝色蕾丝修身显瘦...",
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
                //商品价格与购买人数
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 10,
                        child: Text(
                          "￥300",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Container(
                        
                        child: Text(
                          "1000人已付款",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(10),
                            color: Colors.grey[400],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return items;
  }
}