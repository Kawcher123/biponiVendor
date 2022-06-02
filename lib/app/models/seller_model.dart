class SellerModel {
  User? user;
  ShopInfo? shopInfo;

  SellerModel({this.user, this.shopInfo});

  SellerModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    shopInfo = json['shop_info'] != null
        ? new ShopInfo.fromJson(json['shop_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.shopInfo != null) {
      data['shop_info'] = this.shopInfo!.toJson();
    }
    return data;
  }
}

class User {
  var id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? nidFrontSide;
  String? nidBackSide;
  var status;
  String? deviceToken;
  var otp;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.avatar,
        this.nidFrontSide,
        this.nidBackSide,
        this.status,
        this.deviceToken,
        this.otp,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    nidFrontSide = json['nid_front_side'];
    nidBackSide = json['nid_back_side'];
    status = json['status'];
    deviceToken = json['device_token'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['device_token'] = this.deviceToken;
    data['otp'] = this.otp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ShopInfo {
  var id;
  var sellerId;
  String? name;
  String? slug;
  String? logo;
  String? banner;
  String? division;
  String? district;
  String? area;
  String? shopUnion;
  String? address;
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? routingNumber;
  String? bkash;
  var rocket;
  var nagad;
  var upay;

  ShopInfo(
      {this.id,
        this.sellerId,
        this.name,
        this.slug,
        this.logo,
        this.banner,
        this.division,
        this.district,
        this.area,
        this.shopUnion,
        this.address,
        this.bankName,
        this.accountName,
        this.accountNumber,
        this.routingNumber,
        this.bkash,
        this.rocket,
        this.nagad,
        this.upay});

  ShopInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    name = json['name'];
    slug = json['slug'];
    logo = json['logo'];
    banner = json['banner'];
    division = json['division'];
    district = json['district'];
    area = json['area'];
    shopUnion = json['shop_union'];
    address = json['address'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    routingNumber = json['routing_number'];
    bkash = json['bkash'];
    rocket = json['rocket'];
    nagad = json['nagad'];
    upay = json['upay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['division'] = this.division;
    data['district'] = this.district;
    data['area'] = this.area;
    data['shop_union'] = this.shopUnion;
    data['address'] = this.address;
    data['bank_name'] = this.bankName;
    data['account_name'] = this.accountName;
    data['account_number'] = this.accountNumber;
    data['routing_number'] = this.routingNumber;
    data['bkash'] = this.bkash;
    data['rocket'] = this.rocket;
    data['nagad'] = this.nagad;
    data['upay'] = this.upay;
    return data;
  }
}