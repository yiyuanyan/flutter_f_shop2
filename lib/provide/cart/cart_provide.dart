import 'package:flutter/material.dart';
import 'package:flutterfshop/service/service_method.dart';
import '../../model/cart_model.dart';
class CartProvide with ChangeNotifier {
  CartModel cartModel;
  int code;
  String message;
  List<CartInfo> cartInfo;
  getCartList(String user_id) async{
    var formData = "user_id/" + user_id.toString();
    await request("getMyCartList", formData: formData).then((value){
      cartModel = CartModel.fromJson(value);
      this.code = cartModel.code;
      this.message = cartModel.message;
      this.cartInfo = cartModel.cartInfo;
    });
    notifyListeners();
  }
}