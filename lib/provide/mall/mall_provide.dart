import 'package:flutter/material.dart';
import '../../model/mall_model.dart';
import '../../service/service_method.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
//分类
class CategoryProvide with ChangeNotifier {
  int currentCateogryID = 0;
  CategoryModel categoryModel;
  int code;
  String messqage;
  List<CategorysData> categorysData;
  changCurrentCategoryID(int id){
    this.currentCateogryID = id;
    notifyListeners();
  }
  getCategorys() async{
    await request("getCategorys").then((value){
      categoryModel = CategoryModel.fromJson(value);
      this.code = categoryModel.code;
      this.messqage = categoryModel.messqage;
      this.categorysData = categoryModel.categorysData;
    });
    notifyListeners();
  }
}


//商品
class GoodsProvide with ChangeNotifier {
  GoodsModel goodsModel;
  int code;
  String message;
  List<GoodsData> goodsData;
  getGoods(int category_id) async{
    String formData = "category_id/" + category_id.toString();
    await request("getGoods", formData: formData).then((value){
      goodsModel = GoodsModel.fromJson(value);
      this.code = goodsModel.code;
      this.message = goodsModel.message;
      this.goodsData = goodsModel.goodsData;
    });
    notifyListeners();
  }
}