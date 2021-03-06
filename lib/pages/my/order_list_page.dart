//订单中心
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/config/service_url.dart';
import 'package:flutterfshop/model/order_model.dart';
import 'package:flutterfshop/provide/my/order_provide.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:provide/provide.dart';



class OrderListPage extends StatefulWidget {
  final String orderListKey;

  const OrderListPage({Key key, this.orderListKey}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}
class _OrderListPageState extends State<OrderListPage> {
  List<OrderList> orderList;
  @override
  Widget build(BuildContext context) {
    orderList = Provide.value<OrderProvide>(context).orderList;
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
      body: FutureBuilder(
        future: _getOrderInfo(context,"0" , "1"),
        // ignore: missing_return
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return _orderListView(context);
          }else{
            return Center(
              child: Text("正在加载......"),
            );
          }
        },
      ),
    );
  }
  //订单列表
  Widget _orderListView(BuildContext context){
    List<OrderList> orderList = Provide.value<OrderProvide>(context).orderList;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      child: ListView(
        children: <Widget>[
          _orderCartgory(context),
          _goodsListView(context, orderList),
        ],
      ),
    );
  }
  //订单分类
  Widget _orderCartgory(BuildContext context){
    List<OrderCategory> orderCategory = Provide.value<OrderProvide>(context).orderCategory;
    return Provide<OrderProvide>(
      builder: (context, child, cateogryId){
        return Container(
          height: ScreenUtil().setHeight(36),
          child: Stack(
            children: <Widget>[
              GridView.count(
                crossAxisCount: orderCategory.length,
                crossAxisSpacing: ScreenUtil().setWidth(10),
                childAspectRatio: 2.0,
                shrinkWrap: true,
                children: getOrderTitle(context, orderCategory),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(33)),
                height: ScreenUtil().setHeight(1),
                color: Colors.grey[300],
              ),
            ],
          ),
        );
      },
    );
  }
  List<Widget> getOrderTitle(BuildContext context,List<OrderCategory> orderCategory){
    List<Widget> a = [];
    for(int i=0; i<orderCategory.length; i++){
      a.add(_orderCategoryTitle(context, orderCategory[i].category.toString(), orderCategory[i].id.toInt()));
    }
    return a;
  }
  //订单类型分类title
  Widget _orderCategoryTitle(BuildContext context,String title, int cat_id){

    int currentCategory = Provide.value<OrderProvide>(context).currentCategory;
    Color bottomColors;
    return InkWell(
      onTap: (){
        Provide.value<OrderProvide>(context).changeCategory(cat_id);
        currentCategory = Provide.value<OrderProvide>(context).currentCategory;
        Provide.value<OrderProvide>(context).getOrderListByCategory(currentCategory.toString(), "1");
        print("$currentCategory================================$cat_id");
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
            //color: bottomColors,
            color: currentCategory == cat_id ? Colors.green : Colors.white,
          ),
        ],
      ),
    );
  }
  //商品列表
  Widget _goodsListView(BuildContext context, List<OrderList> orderList){
    return Container(
      child: ListView.builder(
        itemCount: orderList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // ignore: missing_return
        itemBuilder: (BuildContext context, index){
          return _getOrderGoodsItem(context, index, orderList);
        },
      ),
    );
  }
  //订单商品Item
  Widget _getOrderGoodsItem(BuildContext context, int index, List<OrderList> orderList){
    String type;
    switch(orderList[index].type){
      case 0:
        type = "待付款";
        break;
      case 1:
        type = "待发货";
        break;
      case 2:
        type = "待收货";
        break;
      case 3:
        type = "待评价";
        break;
    }
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
                    "订单编号：" + orderList[index].orderNumber.toString(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Text(
                  type,
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
              Image(
                image: NetworkImage(fileURL + orderList[index].image),
                width: ScreenUtil().setWidth(129),
                height: ScreenUtil().setHeight(107),
                fit: BoxFit.fitWidth,
              ),
              //名称
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                width: ScreenUtil().setWidth(210),
                child: Column(
                  children: <Widget>[
                    Text(
                      orderList[index].title.toString(),
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
                        "规格：" + orderList[index].specifications.toString(),
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
                            "￥" + orderList[index].price.toString(),
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
                              "￥" + orderList[index].oldPrice.toString(),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: const Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            "X " + orderList[index].goodsNumber.toString(),
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
                    "共计" + orderList[index].goodsNumber.toString() + "件商品",
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

  Future<String> _getOrderInfo(BuildContext context, String cate_id, String user_id) async {
    await Provide.value<OrderProvide>(context).getOrderCategory(user_id);
    await Provide.value<OrderProvide>(context).getOrderListByCategory(cate_id, user_id);
    return "OK";
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
