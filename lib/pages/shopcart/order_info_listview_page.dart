import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//支付页面列表
class OrderInfoListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(516),
      color: Colors.white,
      child: _orderListView(context),
    );
  }

  Widget _orderListView(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      //physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      // ignore: missing_return
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(5),
          child: index == 9-6 ? Column(children: <Widget>[_orderItem(context, index, 9),Container(height: ScreenUtil().setHeight(3),color: Colors.grey[600], margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),)],) : _orderItem(context, index, 9),
        );
      },
    );
  }
  Widget _orderItem(BuildContext context, int index, int length){
    if(index == 0){
      return _addInfo();
    }else if(index == length-5){
      return _allPrice(); //商品总价
    }else if(index == length-4){
      return _coupon();
    }else if(index == length-3){
      return _express();
    }else if(index == length-2){
      return _expressInsurance();
    }else if(index == length-1){
      return _orderPrice();
    }else{
      return _goodsList(index);
    }

  }

  //地址Widget
  Widget _addInfo(){
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              print("点击了选择地址");
            },
            child: Container(
              height: ScreenUtil().setHeight(110),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                          child: Text(
                            "北京市海淀区",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                          child: Text(
                            "知春路碧兴园6号楼6层606号",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                          child: Text(
                            "老何 13800138000",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),

                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(2),
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  //商品总价
  Widget _allPrice(){
    return Container(
      height: ScreenUtil().setHeight(38),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "商品总价",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "￥39800.00",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //优惠券
  Widget _coupon(){
    return Container(
      height: ScreenUtil().setHeight(38),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "优惠券",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "一张可用优惠券 >",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.pinkAccent,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //快递费
  Widget _express(){
    return Container(
      height: ScreenUtil().setHeight(38),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "运费（快递）",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "￥0.0",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //快递保险
  Widget _expressInsurance(){
    return Container(
      height: ScreenUtil().setHeight(38),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              "运费险",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "￥0.0",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
  //商品列表
  Widget _goodsList(int index){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(30),
          ),
          Image(
            image: AssetImage("assets/images/maill/u281.png"),
            //image: NetworkImage(fileURL + this.cartInfo.image),
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
                    "岚烨2020春秋新款韩版圆领套头字母印花拼色长袖t恤打底衫上衣女学生ins潮 绿色 均码",
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
                        "￥139.00",
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
                        "￥689.00",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(11),
                          color: Colors.grey[600],
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
  //支付价格
  Widget _orderPrice(){
    print("asdfasdf");
    return Container(
      height: ScreenUtil().setHeight(38),
      alignment: Alignment.centerRight,
      child: Text(
        "￥378.00",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(20),
          color: Colors.red,
        ),
      ),
    );
  }



}
