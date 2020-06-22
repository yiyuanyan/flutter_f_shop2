class OrderCategoryModel {
  int code;
  String message;
  List<OrderCategory> orderCategory;

  OrderCategoryModel({this.code, this.message, this.orderCategory});

  OrderCategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['order_category'] != null) {
      orderCategory = new List<OrderCategory>();
      json['order_category'].forEach((v) {
        orderCategory.add(new OrderCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.orderCategory != null) {
      data['order_category'] =
          this.orderCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderCategory {
  int id;
  String category;

  OrderCategory({this.id, this.category});

  OrderCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    return data;
  }
}


class OrderListModel {
  int code;
  String message;
  List<OrderList> orderList;

  OrderListModel({this.code, this.message, this.orderList});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['order_list'] != null) {
      orderList = new List<OrderList>();
      json['order_list'].forEach((v) {
        orderList.add(new OrderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.orderList != null) {
      data['order_list'] = this.orderList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderList {
  int id;
  int orderNumber;
  String image;
  int type;
  String title;
  String specifications;
  String price;
  String oldPrice;
  int goodsNumber;

  OrderList(
      {this.id,
        this.orderNumber,
        this.image,
        this.type,
        this.title,
        this.specifications,
        this.price,
        this.oldPrice,
        this.goodsNumber});

  OrderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    image = json['image'];
    type = json['type'];
    title = json['title'];
    specifications = json['specifications'];
    price = json['price'];
    oldPrice = json['old_price'];
    goodsNumber = json['goods_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['image'] = this.image;
    data['type'] = this.type;
    data['title'] = this.title;
    data['specifications'] = this.specifications;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['goods_number'] = this.goodsNumber;
    return data;
  }
}
