// class NotificationModel {
//   String? status;
//   List<Notification>? notification;
//
//   NotificationModel({this.status, this.notification});
//
//   NotificationModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['notification'] != null) {
//       notification = <Notification>[];
//       json['notification'].forEach((v) {
//         notification!.add(new Notification.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.notification != null) {
//       data['notification'] = this.notification!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Notification {
//   var id;
//   var userId;
//   var userType;
//   String? title;
//   String? description;
//   String? status;
//   String? createdAt;
//
//   Notification({this.id, this.userId, this.userType, this.title, this.description, this.status, this.createdAt});
//
//   Notification.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     userType = json['user_type'];
//     title = json['title'];
//     description = json['description'];
//     status = json['status'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['user_type'] = this.userType;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }

class NotificationModel {
  String? status;
  List<Notification>? notification;

  NotificationModel({this.status, this.notification});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notification {
  var id;
  var userId;
  var userType;
  String? title;
  Description? description;
  String? status;
  String? createdAt;

  Notification(
      {this.id,
        this.userId,
        this.userType,
        this.title,
        this.description,
        this.status,
        this.createdAt});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userType = json['user_type'];
    title = json['title'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['title'] = this.title;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Description {
  var orderId;
  String? type;
  String? message;

  Description({this.orderId, this.type, this.message});

  Description.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}