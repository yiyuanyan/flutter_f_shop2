import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import '../../model/goods_model.dart';

class GoodsInfoProvide with ChangeNotifier {
  GoodsModel goodsModel;
  int code;
  String message;
  String goodsData;
  getGoodsInfo(String goodsId) async{
    await request("getGoodsInfo", formData: "goods_id/$goodsId").then((value){
      goodsModel = GoodsModel.fromJson(value);
      this.code = goodsModel.code;
      this.message = goodsModel.message;
      this.goodsData = goodsModel.goodsData;
      notifyListeners();
    });
  }
}