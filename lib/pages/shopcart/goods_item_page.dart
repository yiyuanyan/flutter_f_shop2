import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/config/service_url.dart';
import 'package:flutterfshop/model/cart_model.dart';

//购物车商品

class GoodsItemPage extends StatelessWidget {
  final int index;
  final CartInfo cartInfo;
  const GoodsItemPage({Key key, @required this.cartInfo, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(110),
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[400],
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: _goodsItem(this.index),
      ),
    );
  }

  Widget _goodsItem(int index){
    print(this.cartInfo.image);
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            onChanged: (bool value){
              print("选择了$index");
            },
          ),
          Image(
            //image: AssetImage("assets/images/maill/u281.png"),
            image: NetworkImage(fileURL + this.cartInfo.image),
            width: ScreenUtil().setWidth(65),
            height: ScreenUtil().setHeight(65),
          ),
          Container(
            width: ScreenUtil().setWidth(247),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(5), top: ScreenUtil().setHeight(10), right: ScreenUtil().setWidth(5)),

            child: Column(
              children: <Widget>[
                //名称
                Container(
                  child: Text(
                    this.cartInfo.goodsName,
                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                //标签
                Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "颜色：" + "褐色;",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11),
                          color: Colors.grey[600],
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Text(
                        "类型：" + "英伦风格;",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11),
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                //价格
                Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                  child: Row(
                    children: <Widget>[
                      //价格
                      Text(
                        this.cartInfo.goodsPrice,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11),
                          color: Colors.red,
                        ),
                      ),
                      //间距
                      Container(
                        width: ScreenUtil().setWidth(10),
                      ),
                      //原始价格
                      Text(
                        this.cartInfo.goodsOldPrice,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11),
                          color: Colors.grey[600],
                        ),
                      ),
                      //可变间距
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      //减号按钮
                      InkWell(
                        onTap: (){print("商品数量-1");},
                        child: Container(
                          width: ScreenUtil().setWidth(20),
                          height: ScreenUtil().setHeight(25),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                      //间距
                      Container(
                        width: ScreenUtil().setWidth(10),
                      ),
                      //商品数量
                      Container(
                        child: Text(
                          this.cartInfo.number.toString(),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      //间距
                      Container(
                        width: ScreenUtil().setWidth(10),
                      ),
                      //加号按钮
                      InkWell(
                        onTap: (){print("商品数量+1");},
                        child: Container(
                          width: ScreenUtil().setWidth(20),
                          height: ScreenUtil().setHeight(25),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
