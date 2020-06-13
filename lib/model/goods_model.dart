class GoodsModel {
  int code;
  String message;
  String goodsData;

  GoodsModel({this.code, this.message, this.goodsData});

  GoodsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    goodsData = json['goods_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['goods_data'] = this.goodsData;
    return data;
  }
}