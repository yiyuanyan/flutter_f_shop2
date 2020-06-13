class MessageModel {
  int code;
  String message;
  Data data;

  MessageModel({this.code, this.message, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
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
  List<SystemNotification> systemNotification;
  List<NormalNotification> normalNotification;

  Data({this.systemNotification, this.normalNotification});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['system_notification'] != null) {
      systemNotification = new List<SystemNotification>();
      json['system_notification'].forEach((v) {
        systemNotification.add(new SystemNotification.fromJson(v));
      });
    }
    if (json['normal_notification'] != null) {
      normalNotification = new List<NormalNotification>();
      json['normal_notification'].forEach((v) {
        normalNotification.add(new NormalNotification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.systemNotification != null) {
      data['system_notification'] =
          this.systemNotification.map((v) => v.toJson()).toList();
    }
    if (this.normalNotification != null) {
      data['normal_notification'] =
          this.normalNotification.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SystemNotification {
  int id;
  String title;
  String message;
  String date;

  SystemNotification({this.id, this.title, this.message, this.date});

  SystemNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['date'] = this.date;
    return data;
  }
}

class NormalNotification {
  int id;
  String title;
  String message;
  String date;

  NormalNotification({this.id, this.title, this.message, this.date});

  NormalNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['date'] = this.date;
    return data;
  }
}