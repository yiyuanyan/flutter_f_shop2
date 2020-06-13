import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';

class NewUserGridView extends StatelessWidget {
  final String userId;
  const NewUserGridView({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.grey[600],
          onPressed: () {
            Application.router.pop(context);
          },
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Container(
          width: ScreenUtil().setWidth(245),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "新人专项",
              style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //banner
            _newUserBanner(),
            _goodsGridList(),
          ],
        ),
      ),
    );
  }

  Widget _newUserBanner() {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(139),
      child: Image(
        width: ScreenUtil().setWidth(375),
        height: ScreenUtil().setHeight(139),
        image: AssetImage(
          "assets/images/index/u700.png",
        ),
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _goodsGridList() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(17), right: ScreenUtil().setWidth(17)),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        mainAxisSpacing: 5,
        childAspectRatio: 0.76,
        physics: NeverScrollableScrollPhysics(),
        children: _goodsItems(),
      ),
    );
  }

  List<Widget> _goodsItems() {
    List<Widget> items = List();
    for (int i = 0; i < 10; i++) {
      items.add(
        Container(
          //color: Colors.green,
          child: Column(
            children: <Widget>[
              //商品图片
              Image(
                image: AssetImage("assets/images/index/u717.png"),
                width: ScreenUtil().setWidth(161),
                height: ScreenUtil().setHeight(115),
                fit: BoxFit.fill,
              ),
              //商品名称
              Text(
                "淡蓝色连衣短裙，时尚大方，清爽舒服淡蓝色连衣短裙，时尚大方，清爽舒服",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              //分割线
              Container(
                height: ScreenUtil().setHeight(5),
              ),
              //商品价格
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Text(
                        "￥1000.00",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.red),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "￥3000.00",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey[400],
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //间距
              Container(
                height: ScreenUtil().setHeight(5),
              ),
              //购买按钮
              InkWell(
                onTap: (){
                  print("点击购买新人专享按钮");
                },
                child: Container(
                  width: ScreenUtil().setWidth(160),
                  height: ScreenUtil().setHeight(30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "立即购买",
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
        ),
      );
    }
    return items;
  }
}
