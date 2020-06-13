class HomeModel {
  int code;
  Null message;
  List<String> swipers;
  NewUser newUser;
  List<SortList> sortList;
  String eventsBanner;

  HomeModel(
      {this.code,
        this.message,
        this.swipers,
        this.newUser,
        this.sortList,
        this.eventsBanner});

  HomeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    swipers = json['swipers'].cast<String>();
    newUser = json['new_user'] != null
        ? new NewUser.fromJson(json['new_user'])
        : null;
    if (json['sort_list'] != null) {
      sortList = new List<SortList>();
      json['sort_list'].forEach((v) {
        sortList.add(new SortList.fromJson(v));
      });
    }
    eventsBanner = json['events_banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['swipers'] = this.swipers;
    if (this.newUser != null) {
      data['new_user'] = this.newUser.toJson();
    }
    if (this.sortList != null) {
      data['sort_list'] = this.sortList.map((v) => v.toJson()).toList();
    }
    data['events_banner'] = this.eventsBanner;
    return data;
  }
}

class NewUser {
  List<String> privilege;
  String banner;

  NewUser({this.privilege, this.banner});

  NewUser.fromJson(Map<String, dynamic> json) {
    privilege = json['privilege'].cast<String>();
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privilege'] = this.privilege;
    data['banner'] = this.banner;
    return data;
  }
}

class SortList {
  String title;
  String image;

  SortList({this.title, this.image});

  SortList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}


class RecommendCommodityModel {
  int code;
  String message;
  List<Data> data;

  RecommendCommodityModel({this.code, this.message, this.data});

  RecommendCommodityModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String image;
  String price;
  String oldPrice;

  Data({this.id, this.name, this.image, this.price, this.oldPrice});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    return data;
  }
}

//限时抢购模型
class PanicBuyModel {
  int code;
  String message;
  List<PanicBuyData> panicBuyData;

  PanicBuyModel({this.code, this.message, this.panicBuyData});

  PanicBuyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['panic_buy_data'] != null) {
      panicBuyData = new List<PanicBuyData>();
      json['panic_buy_data'].forEach((v) {
        panicBuyData.add(new PanicBuyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.panicBuyData != null) {
      data['panic_buy_data'] =
          this.panicBuyData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PanicBuyData {
  int id;
  String startTime;
  String endTime;
  int state;

  PanicBuyData({this.id, this.startTime, this.endTime, this.state});

  PanicBuyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['state'] = this.state;
    return data;
  }
}