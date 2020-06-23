import 'package:flutter/material.dart';
import 'package:flutterfshop/model/my_add_model.dart';
import 'package:flutterfshop/service/service_method.dart';

class MyAddProvide with ChangeNotifier {
  int code;
  String message;
  List<AddList> addList;

  getMyAddList(String user_id) async{
    var formData = "user_id/$user_id";
    MyAddModel _myAddModel;
    await request("getMyAddList", formData: formData).then((value){
      _myAddModel = MyAddModel.fromJson(value);
      this.code = _myAddModel.code;
      this.message = _myAddModel.message;
      this.addList = _myAddModel.addList;
    });
    notifyListeners();
  }
}