import 'package:flutter/material.dart';
import 'package:flutterfshop/service/service_method.dart';
import '../../model/message_model.dart';
class MessageProvide with ChangeNotifier {
  MessageModel messageModel;
  int code;
  String message;
  Data data;
  getMessageCenter(int userId) async{
    String formData = "user_id/" + userId.toString();
    print(formData);
    await request("getMessageCenter", formData: formData).then((value){
      messageModel = MessageModel.fromJson(value);
      this.code = messageModel.code;
      this.message = messageModel.message;
      this.data = messageModel.data;
      print(this.message);
      notifyListeners();
    });
  }
}