//订单中心
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';
class OrderListPage extends StatelessWidget {
  final String orderListKey;

  const OrderListPage({Key key, this.orderListKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Application.router.pop(context);
          },
          icon: Icon(Icons.navigate_before),
          color: Colors.grey[600],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "订单中心",
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
      ),
      body: _orderListView(context),
    );
  }
  //订单列表
  Widget _orderListView(BuildContext context){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      child: ListView(
        children: <Widget>[
          _orderCartgory(),
          _goodsListView(context),
        ],
      ),
    );
  }
  //订单分类
  Widget _orderCartgory(){
    return Container(
      height: ScreenUtil().setHeight(36),
      child: Stack(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: ScreenUtil().setWidth(10),
            childAspectRatio: 2.0,
            shrinkWrap: true,
            children: getOrderTitle(),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(33)),
            height: ScreenUtil().setHeight(1),
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
  List<Widget> getOrderTitle(){
    List<Widget> a = [];
    for(int i=0; i<5; i++){
      a.add(_orderCategoryTitle("全部", i));
    }
    return a;
  }
  //订单类型分类title
  Widget _orderCategoryTitle(String title, int cat_id){
    return InkWell(
      onTap: (){
        print("点击了$cat_id分类Title");
      },
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(32),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            ),
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(3)),
          ),

          Container(
            height: ScreenUtil().setHeight(2),
            color: cat_id == 0 ? Colors.green : Colors.white,
          ),
        ],
      ),
    );
  }
  //商品列表
  Widget _goodsListView(BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // ignore: missing_return
        itemBuilder: (BuildContext context, index){
          return _getOrderGoodsItem(context, index);
        },
      ),
    );
  }
  //订单商品Item
  Widget _getOrderGoodsItem(BuildContext context, int index){
    print(index);
    return Container(
      width: ScreenUtil().setWidth(365),
      height: ScreenUtil().setHeight(243),
      child: Column(
        children: <Widget>[
          //订单与状态
          Container(
            height: ScreenUtil().setHeight(35),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    "订单编号：2019090112456",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Text(
                  "待付款",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          //图片名称
          Row(
            children: <Widget>[
              Image(image: AssetImage("assets/images/index/u717.png"), width: ScreenUtil().setWidth(129), height: ScreenUtil().setHeight(107), fit: BoxFit.fitWidth,),
              //名称
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                width: ScreenUtil().setWidth(210),
                child: Column(
                  children: <Widget>[
                    Text(
                      "仙女白色连衣裙，纯棉设计，洋气大方，韩版流行休闲网韩版流行休闲网",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Colors.black,
                      ),
                    ),
                    Container(height: ScreenUtil().setHeight(5),),
                    //规格
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "规格：白色，39码",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(height: ScreenUtil().setHeight(5),),
                    //价格与数量
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "￥2087.00",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "￥2087.00",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: const Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            "X 1",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //分割线
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
            color: Colors.grey[400],
            height: 1,
          ),
          //价格合计
          Container(
            width: ScreenUtil().setWidth(365),
            height: ScreenUtil().setHeight(35),
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(130),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "共计1件商品",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "合计：",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "￥129384.00",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //按钮
          Container(
            width: ScreenUtil().setWidth(365),
            height: ScreenUtil().setHeight(40),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    print("点击了联系客服按钮");
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(86),
                    height: ScreenUtil().setHeight(27),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400],
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(13)),
                    ),
                    child: Center(
                      child: Text(
                        "联系客服",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
                //分割
                Container(width: ScreenUtil().setWidth(10),),
                InkWell(
                  onTap: (){
                    print("点击了取消订单按钮");
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(86),
                    height: ScreenUtil().setHeight(27),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400],
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(13)),
                    ),
                    child: Center(
                      child: Text(
                        "取消订单",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
                //分割
                Container(width: ScreenUtil().setWidth(10),),
                InkWell(
                  onTap: (){
                    print("点击了立即付款按钮");
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(86),
                    height: ScreenUtil().setHeight(27),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400],
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(13)),
                    ),
                    child: Center(
                      child: Text(
                        "立即付款",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //分割线
          Container(
            height: ScreenUtil().setHeight(10),
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
