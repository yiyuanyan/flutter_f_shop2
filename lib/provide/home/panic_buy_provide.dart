import 'package:flutter/material.dart';
import 'dart:convert';
import '../../config/service_url.dart';
import '../../model/home_model.dart';
import 'package:flutterfshop/service/service_method.dart';
class PanicBuyProvide with ChangeNotifier {
  int code;
  String message;
  List<PanicBuyData> panicBuyData;
  PanicBuyModel _panicBuyModel;
  int currentIndex = 0;
  changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
  getPanicBuyTimeInfo() async{
    await request("getPanicBuyTimeInfo").then((value){
      this._panicBuyModel = PanicBuyModel.fromJson(value);
      if(this._panicBuyModel.code == 200){
        this.code = this._panicBuyModel.code;
        this.message = this._panicBuyModel.message;
        this.panicBuyData = this._panicBuyModel.panicBuyData;
      }else{
        this.code = this._panicBuyModel.code;
      }
    });
    notifyListeners();
  }
}