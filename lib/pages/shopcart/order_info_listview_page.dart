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
        return _orderItem(context, index);
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
                flex: 1,
                child: Column(
                  children: <Widget>[

                  ],
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
