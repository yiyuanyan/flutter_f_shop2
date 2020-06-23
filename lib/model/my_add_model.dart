class MyAddModel {
  int code;
  String message;
  List<AddList> addList;

  MyAddModel({this.code, this.message, this.addList});

  MyAddModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['add_list'] != null) {
      addList = new List<AddList>();
      json['add_list'].forEach((v) {
        addList.add(new AddList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.addList != null) {
      data['add_list'] = this.addList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddList {
  int id;
  String name;
  String phone;
  String address;
  int isDefault;

  AddList({this.id, this.name, this.phone, this.address, this.isDefault});

  AddList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['is_default'] = this.isDefault;
    return data;
  }
}