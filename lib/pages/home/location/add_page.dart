import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfshop/model/location_model.dart';
import 'package:flutterfshop/pages/home/location/add_input_widget.dart';
import 'package:flutterfshop/pages/home/location/listview_arrive.dart';
import 'package:flutterfshop/pages/home/location/listview_my_address.dart';
import 'package:flutterfshop/pages/home/location/listview_nearby.dart';
import 'package:flutterfshop/provide/location/location_provide.dart';
import 'package:flutterfshop/routers/application.dart';
import 'package:provide/provide.dart';

class AddPage extends StatelessWidget {
  final String userId;
  const AddPage({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Nearby> nearby = Provide.value<LocationProvide>(context).nearby;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.grey[500],
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Application.router.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Container(
          width: ScreenUtil().setWidth(245),
          alignment: Alignment.center,
          child: Text(
            "选择收货地址",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print("新增地址");
            },
            child: Container(
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              alignment: Alignment.center,
              child: Text(
                "新增地址",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: ScreenUtil().setSp(10),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getAddInfo(context, 5),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                AddInputWidget(),
                ListViewArrive(),
                ListViewMyAddress(),
                ListViewNearby(headerTitle: "附近", nearby: nearby,),
              ],
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

  Future<String> _getAddInfo(BuildContext context, int userId) async {
    await Provide.value<LocationProvide>(context).getAddInfo(userId);
    return "OK";
  }
}
