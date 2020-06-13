import 'package:flutter/material.dart';
import '../../model/location_model.dart';
import '../../service/service_method.dart';
import 'package:provide/provide.dart';
import 'dart:convert';

class LocationProvide with ChangeNotifier {
  LocationModel locationModel;
  int code;
  String message;
  String currentAdd;
  List<ReceivingAdd> receivingAdd;
  List<Nearby> nearby;
  getAddInfo(int userId) async{
    String formData = "user_id/" + userId.toString();
    print(formData);
    await request('getAddInfo', formData: formData).then((value){
      locationModel = LocationModel.fromJson(value);
      this.code = locationModel.code;
      this.message = locationModel.message;
      this.currentAdd = locationModel.currentAdd;
      this.receivingAdd = locationModel.receivingAdd;
      this.nearby = locationModel.nearby;
      notifyListeners();
    });
  }
}