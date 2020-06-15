class CartModel {
  int code;
  String message;
  List<CartInfo> cartInfo;

  CartModel({this.code, this.message, this.cartInfo});

  CartModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['cart_info'] != null) {
      cartInfo = new List<CartInfo>();
      json['cart_info'].forEach((v) {
        cartInfo.add(new CartInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.cartInfo != null) {
      data['cart_info'] = this.cartInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartInfo {
  int id;
  String goodsName;
  String image;
  String goodsPrice;
  String goodsOldPrice;
  int number;

  CartInfo(
      {this.id,
        this.goodsName,
        this.image,
        this.goodsPrice,
        this.goodsOldPrice,
        this.number});

  CartInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsName = json['goods_name'];
    image = json['image'];
    goodsPrice = json['goods_price'];
    goodsOldPrice = json['goods_old_price'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_name'] = this.goodsName;
    data['image'] = this.image;
    data['goods_price'] = this.goodsPrice;
    data['goods_old_price'] = this.goodsOldPrice;
    data['number'] = this.number;
    return data;
  }
}