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
      physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      // ignore: missing_return
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(5),
          child: _orderItem(context, index),
        );
      },
    );
  }

  Widget _orderItem(BuildContext context, int index){
    if(index == 0){
      return InkWell(
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
      );
    }
    return Container();
  }
}
