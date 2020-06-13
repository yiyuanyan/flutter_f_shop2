//分类模型
class CategoryModel {
  int code;
  String messqage;
  List<CategorysData> categorysData;

  CategoryModel({this.code, this.messqage, this.categorysData});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messqage = json['messqage'];
    if (json['categorys_data'] != null) {
      categorysData = new List<CategorysData>();
      json['categorys_data'].forEach((v) {
        categorysData.add(new CategorysData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messqage'] = this.messqage;
    if (this.categorysData != null) {
      data['categorys_data'] =
          this.categorysData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategorysData {
  int id;
  String categoryName;

  CategorysData({this.id, this.categoryName});

  CategorysData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    return data;
  }
}


//商品模型
class GoodsModel {
  int code;
  String message;
  List<GoodsData> goodsData;

  GoodsModel({this.code, this.message, this.goodsData});

  GoodsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['goods_data'] != null) {
      goodsData = new List<GoodsData>();
      json['goods_data'].forEach((v) {
        goodsData.add(new GoodsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.goodsData != null) {
      data['goods_data'] = this.goodsData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodsData {
  int id;
  String image;
  String goodsName;
  String goodsDesc;
  String goodsLabel;
  String goodsOrder;
  String goodsPrice;
  String goodsOldPrice;

  GoodsData(
      {this.id,
      this.image,
      this.goodsName,
      this.goodsDesc,
      this.goodsLabel,
      this.goodsOrder,
      this.goodsPrice,
      this.goodsOldPrice});

  GoodsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    goodsName = json['goods_name'];
    goodsDesc = json['goods_desc'];
    goodsLabel = json['goods_label'];
    goodsOrder = json['goods_order'];
    goodsPrice = json['goods_price'];
    goodsOldPrice = json['goods_old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['goods_name'] = this.goodsName;
    data['goods_desc'] = this.goodsDesc;
    data['goods_label'] = this.goodsLabel;
    data['goods_order'] = this.goodsOrder;
    data['goods_price'] = this.goodsPrice;
    data['goods_old_price'] = this.goodsOldPrice;
    return data;
  }
}