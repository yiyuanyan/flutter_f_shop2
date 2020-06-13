import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../model/home_model.dart';
import '../../../provide/home/home_provide.dart';
import '../../../config/service_url.dart';
class CategoryGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SortList> sortList = Provide.value<HomeProvide>(context).sortList;
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
      height: ScreenUtil().setHeight(150),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 1,
        //宽高比
        childAspectRatio: 5 / 4,
        padding: EdgeInsets.all(5),
        children: sortList.map((val){
          return _gridViewItemUI(context, val);
        }).toList(),
      ),
    );
  }
  Widget _gridViewItemUI(BuildContext context, item){
    return InkWell(
      onTap: (){
        print("点击了分类导航");
      },
      child: Container(
        height: ScreenUtil().setHeight(30),
        child: Column(
          children: <Widget>[
            Image.network(
              "${fileURL}${item.image}",
              width: ScreenUtil().setWidth(35),
              height: ScreenUtil().setHeight(30),
            ),
            Container(
              height: ScreenUtil().setHeight(10),
            ),
            Text(
              item.title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
