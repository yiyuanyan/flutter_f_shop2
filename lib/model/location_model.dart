class LocationModel {
  int code;
  String message;
  String currentAdd;
  List<ReceivingAdd> receivingAdd;
  List<Nearby> nearby;

  LocationModel(
      {this.code,
        this.message,
        this.currentAdd,
        this.receivingAdd,
        this.nearby});

  LocationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    currentAdd = json['current_add'];
    if (json['receiving_add'] != null) {
      receivingAdd = new List<ReceivingAdd>();
      json['receiving_add'].forEach((v) {
        receivingAdd.add(new ReceivingAdd.fromJson(v));
      });
    }
    if (json['nearby'] != null) {
      nearby = new List<Nearby>();
      json['nearby'].forEach((v) {
        nearby.add(new Nearby.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['current_add'] = this.currentAdd;
    if (this.receivingAdd != null) {
      data['receiving_add'] = this.receivingAdd.map((v) => v.toJson()).toList();
    }
    if (this.nearby != null) {
      data['nearby'] = this.nearby.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReceivingAdd {
  int id;
  String myAdd;
  String contact;
  String telephone;

  ReceivingAdd({this.id, this.myAdd, this.contact, this.telephone});

  ReceivingAdd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    myAdd = json['my_add'];
    contact = json['contact'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['my_add'] = this.myAdd;
    data['contact'] = this.contact;
    data['telephone'] = this.telephone;
    return data;
  }
}

class Nearby {
  int id;
  String communityName;

  Nearby({this.id, this.communityName});

  Nearby.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    communityName = json['community_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['community_name'] = this.communityName;
    return data;
  }
}