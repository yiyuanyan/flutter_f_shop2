import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../model/order_model.dart';

class OrderProvide with ChangeNotifier {
  int code;
  String message;
  List<OrderCategory> orderCategory;
  OrderCategoryModel orderCategoryModel;
  OrderListModel orderListModel;

  int currentCategory = 0;
  changeCategory(int index){
    currentCategory = index;
    notifyListeners();
  }


  getOrderCategory(String user_id) async{
    await request("getOrderCategory", formData: "user_id/$user_id").then((value){
      orderCategoryModel = OrderCategoryModel.fromJson(value);
      this.code = orderCategoryModel.code;
      this.message = orderCategoryModel.message;
      this.orderCategory = orderCategoryModel.orderCategory;
    });
    notifyListeners();
  }
  int orderCode;
  String orderMessage;
  List<OrderList> orderList;
  getOrderListByCategory(String cate_id, String user_id) async {
    var formData = "user_id/$user_id/cate_id/$cate_id";
    await request("getOrderListByCategory", formData: formData).then((value){
      orderListModel = OrderListModel.fromJson(value);
      this.orderCode = orderListModel.code;
      this.orderMessage = orderListModel.message;
      this.orderList = orderListModel.orderList;
    });
    notifyListeners();
  }
}