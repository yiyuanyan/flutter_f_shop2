class UserInfoModel {
  int code;
  String message;
  Data data;

  UserInfoModel({this.code, this.message, this.data});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userImg;
  String userName;
  int userId;
  int balance;
  int redEnvelopes;
  int coupon;
  int integral;

  Data(
      {this.userImg,
        this.userName,
        this.userId,
        this.balance,
        this.redEnvelopes,
        this.coupon,
        this.integral});

  Data.fromJson(Map<String, dynamic> json) {
    userImg = json['user_img'];
    userName = json['user_name'];
    userId = json['user_id'];
    balance = json['balance'];
    redEnvelopes = json['red_envelopes'];
    coupon = json['coupon'];
    integral = json['integral'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_img'] = this.userImg;
    data['user_name'] = this.userName;
    data['user_id'] = this.userId;
    data['balance'] = this.balance;
    data['red_envelopes'] = this.redEnvelopes;
    data['coupon'] = this.coupon;
    data['integral'] = this.integral;
    return data;
  }
}