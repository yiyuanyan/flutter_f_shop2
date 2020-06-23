import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/provide/my/my_add_provide.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:provide/provide.dart';
import '../../model/my_add_model.dart';

class MyAddPage extends StatelessWidget {
  final String user_id;

  const MyAddPage({Key key, this.user_id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.grey[600],
          onPressed: (){
            Application.router.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "我的地址",
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _getMyAddList(context, user_id),
        builder: (BuildContext context, snapshot){

          if(snapshot.data == "OK"){
            return _getAddListView(context);
          }else{
            return Container(
              child: Center(
                child: Text("正在加载......"),
              ),
            );
          }
        },
      ),
    );
  }
  Widget _getAddListView(BuildContext context){
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(375),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(553.9),
            child: ListView.builder(
              itemCount: 5,
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // ignore: missing_return
              itemBuilder: (context, index){
                return addItems(context, index);
              },
            ),
          ),
          addButton(context),
        ],
      ),

    );
  }
  Widget addItems(BuildContext context, int index){
    List<AddList> addList = Provide.value<MyAddProvide>(context).addList;
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(150),
          color: Colors.white,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(10), bottom: ScreenUtil().setHeight(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //姓名电话
              Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(20),),
                height: ScreenUtil().setHeight(40),
                child: Row(
                  children: <Widget>[
                    Text(
                      addList[index].name.toString(),
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Container(width: ScreenUtil().setWidth(30),),
                    Text(
                      addList[index].phone.toString(),
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              //地址
              Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(20),),
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  "收货地址： " + addList[index].address.toString(),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(0)),
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(7),),
                width: ScreenUtil().setWidth(280),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: addList[index].isDefault.toInt() == 1 ? true : false,
                      //value: index == 1 ? true : false,
                    ),
                    Text(
                      "设为默认地址",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(70),),
                    InkWell(
                      onTap: (){
                        print("点击了编辑按钮");
                      },
                      child: Image(image: AssetImage("assets/images/ucenter/edit_icon.png"), width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(20),),
                    InkWell(
                      onTap: (){
                        print("点击了删除按钮");
                      },
                      child: Image(image: AssetImage("assets/images/ucenter/delete_icon.png"), width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //分割线
        Container(
          height: ScreenUtil().setHeight(5),
          color: Colors.grey[300],
        )
      ],
    );
  }
  Widget addButton(BuildContext context){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/newAdd?user_id=1");
        print("点击了新增地址按钮");
      },
      child: Container(
        height: ScreenUtil().setHeight(35),
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            "新增收货地址",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _getMyAddList(BuildContext context, String user_id) async{
    await Provide.value<MyAddProvide>(context).getMyAddList(user_id);
    int code = Provide.value<MyAddProvide>(context).code;
    if(code == 200){
      return "OK";
    }else{
      return "false";
    }

  }
}
