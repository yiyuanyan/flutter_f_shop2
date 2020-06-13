import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../model/home_model.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
class RecommendCommodityProvide with ChangeNotifier {
  
  RecommendCommodityModel recommendCommodityModel;
  int statCode;
  String message;
  List<Data> data;
  getRecommendCommodityInfo() async{
    print("8888888888888888888");
    await request('getRecommendCommodity').then((val){
      
      //var jsonInfo = json.decode(val.toString());
      recommendCommodityModel = RecommendCommodityModel.fromJson(val);
      if(recommendCommodityModel.code == 200){
        this.statCode = 200;
        this.message = recommendCommodityModel.message;
        this.data = recommendCommodityModel.data;
      }else{
        this.statCode = recommendCommodityModel.code;
      }
    });
    notifyListeners();
  }
}