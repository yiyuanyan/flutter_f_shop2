import 'dart:ui';
import 'package:flutterfshop/provide/home/message_provide.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:flutterfshop/service/service_method.dart';
import 'package:provide/provide.dart';
import '../../../model/message_model.dart';


class MessageCenterWidget extends StatelessWidget {
  final String userId;
  const MessageCenterWidget({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.grey[800],
          onPressed: (){
            Application.router.pop(context);
          },
        ),
        title: Container(
          width: ScreenUtil().setWidth(245),
          alignment: Alignment.center,
          child: Text(
            "消息中心",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: _getMessageCenter(context, 5),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print(snapshot.hasData);
          if(snapshot.hasData){
            return Container(
              child: _getMessageListView(context),
            );
          }else{
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 44.0,
                width: 44.0,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _getMessageListView(BuildContext context){
    List<SystemNotification> systemNotification = Provide.value<MessageProvide>(context).data.systemNotification;
    List<Widget> notice = List();
    for(int i=0; i<systemNotification.length; i++){
      notice.add(
        ListTile(
          leading: Image.asset("assets/images/index/all_message.png", width: ScreenUtil().setWidth(18),),
          title: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(148),
                child: Text(
                  systemNotification[i].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Text(
                systemNotification[i].date,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          subtitle: Text(systemNotification[i].message),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      );
      notice.add(
        Divider(height: 1.0,indent: 0,color: Colors.grey[300],),
      );
    }

    List<NormalNotification> normalNotification = Provide.value<MessageProvide>(context).data.normalNotification;
    List<Widget> notice2 = [];
    for(int j=0; j<normalNotification.length; j++){
      notice2.add(
        ListTile(
          leading: Image.asset("assets/images/index/new_message.png", width: ScreenUtil().setWidth(18),),
          title: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(158),
                child: Text(
                  normalNotification[j].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Text(
                normalNotification[j].date,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          subtitle: Text(normalNotification[j].message),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        
      );
      notice2.add(
        Divider(height: 1.0,indent: 0,color: Colors.grey[300],),
      );
    }
    notice.addAll(notice2);
    
    return ListView(
      children: notice,
    );
  }

  Future<String> _getMessageCenter(BuildContext context, int userId) async{
    await Provide.value<MessageProvide>(context).getMessageCenter(userId);
    if(Provide.value<MessageProvide>(context).code == 200){
      String m = Provide.value<MessageProvide>(context).message;
      print(m);
      return "OK";
    }
    return "OK1";
  }
}