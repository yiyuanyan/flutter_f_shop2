import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/provide/mall/mall_provide.dart';
import '../../../model/mall_model.dart';
import 'package:provide/provide.dart';

class LeftCategoryListWidget extends StatefulWidget {
  LeftCategoryListWidget({Key key}) : super(key: key);

  @override
  _LeftCategoryListWidgetState createState() => _LeftCategoryListWidgetState();
}


class _LeftCategoryListWidgetState extends State<LeftCategoryListWidget>  {
  //const LeftCategoryListWidget({Key key}) : super(key: key);
  int currentCateogryID;
  List<CategorysData> categorysData;
  @override
  Widget build(BuildContext context) {
    categorysData = Provide.value<CategoryProvide>(context).categorysData;
    return Provide<CategoryProvide>(
      builder: (context, child, currentCategoryID){
        return Container(
          margin: EdgeInsets.only(top:ScreenUtil().setHeight(20)),
          width: ScreenUtil().setWidth(90),
          child: ListView.builder(
            itemCount: this.categorysData.length,
            primary:false,  //内容不足不滚动
            itemExtent: ScreenUtil().setHeight(54),
            itemBuilder: (context, index) => _getCategoryListItem(context, index),
          ),
        );
      },
    );
  }

  Widget _getCategoryListItem(BuildContext context, int index){
    int id = this.categorysData[index].id;
    String name = this.categorysData[index].categoryName;
    int currentCategory = Provide.value<CategoryProvide>(context).currentCateogryID;
    return InkWell(
      onTap: (){
        Provide.value<CategoryProvide>(context).changCurrentCategoryID(id);
        currentCategory = Provide.value<CategoryProvide>(context).currentCateogryID;
        Provide.value<GoodsProvide>(context).getGoods(id);
        print("$currentCategory---------------------------${id}");
      },
      child: Container(
        width: ScreenUtil().setWidth(90),
        height: ScreenUtil().setHeight(54),
        color: currentCategory == id ? Colors.white : Colors.grey[400],
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left:ScreenUtil().setWidth(5)),
              width: ScreenUtil().setWidth(5),
              height: ScreenUtil().setHeight(18),
              color: currentCategory == id ? Colors.red : Colors.grey[400],
            ),
            Container(
              width: ScreenUtil().setWidth(75),
              alignment: Alignment.center,
              child: Text("$name"),
            ),
          ],
        ),
      ),
    );
  }
}