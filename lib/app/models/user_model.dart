class UserModel {
  var status;
  Vendor? vendor;
  String? token;
  var expire;

  UserModel({this.status, this.vendor, this.token, this.expire});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    token = json['token'];
    expire = json['expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    data['token'] = this.token;
    data['expire'] = this.expire;
    return data;
  }
}

class Vendor {
  var id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? nidFrontSide;
  String? nidBackSide;
  var status;

  Vendor(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.avatar,
        this.nidFrontSide,
        this.nidBackSide,
        this.status});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    nidFrontSide = json['nid_front_side'];
    nidBackSide = json['nid_back_side'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['nid_front_side'] = this.nidFrontSide;
    data['nid_back_side'] = this.nidBackSide;
    data['status'] = this.status;
    return data;
  }
}