import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../model/user_info_model.dart';
class MyProvide with ChangeNotifier {
  UserInfoModel userInfoModel;
  int code;
  String message;
  Data data;
  getUserInfo(String user_id) async{
    var formData = "user_id/$user_id";
    await request("getUserInfo", formData: formData).then((value){
      userInfoModel = UserInfoModel.fromJson(value);
      this.code = userInfoModel.code;
      this.message = userInfoModel.message;
      this.data = userInfoModel.data;
    });
    notifyListeners();
  }
}