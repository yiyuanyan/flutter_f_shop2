import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';

//我的资料
class MyInformationPage extends StatelessWidget {
  final String user_id;

  const MyInformationPage({Key key, this.user_id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.navigate_before), color: Colors.grey[600], onPressed: (){ Application.router.pop(context); }),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "我的资料",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _myInfoListView(context),
      ),
    );
  }

  //资料列表
  Widget _myInfoListView(BuildContext context){
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          Column(
            children: <Widget>[
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "头像",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(48),
                        height: ScreenUtil().setHeight(48),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("http://192.168.0.80:84/static//images/my/u281.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                    ],
                  ),
                ),
                
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(
                height: 1,
                indent: 0,
                color: Colors.grey[400],
              ),
              //用户昵称
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "用户昵称",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "木子酱",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                    ],
                  ),
                ),

                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(
                height: 1,
                indent: 0,
                color: Colors.grey[400],
              ),
              //账号
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "账号",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "37507963",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                    ],
                  ),
                ),

                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(
                height: 1,
                indent: 0,
                color: Colors.grey[400],
              ),
              //地区
              ListTile(
                title: Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(20),),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "地区",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "请输入",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10),),
                    ],
                  ),
                ),

                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(
                height: 1,
                indent: 0,
                color: Colors.grey[400],
              ),
            ],
          ),
        ],
      ).toList(),
    );
  }
}
