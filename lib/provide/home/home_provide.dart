import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import 'package:flutterfshop/service/service_method.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
class HomeProvide with ChangeNotifier {
  HomeModel homeModel;
  List<String> swipers;
  List<SortList> sortList;
  NewUser newUser;
  String eventsBanner;
  int currentIndex = 0;
  int statCode = 0;
  changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
  getHomeContent() async{
    await request('getHomeContent').then((val){
      //var jsonInfo = json.decode(val.toString());
      homeModel = HomeModel.fromJson(val);
      if(homeModel.code == 200){
        this.swipers = homeModel.swipers;
        this.newUser = homeModel.newUser;
        this.sortList = homeModel.sortList;
        this.eventsBanner = homeModel.eventsBanner;
        this.statCode = 200;
      }else{
        this.statCode = homeModel.code;
      }
    });
    notifyListeners();
  }
}