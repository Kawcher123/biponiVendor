class CustomerListModel {
  List<VendorCustomer>? vendorCustomer;

  CustomerListModel({this.vendorCustomer});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    if (json['vendor_customer'] != null) {
      vendorCustomer = <VendorCustomer>[];
      json['vendor_customer'].forEach((v) {
        vendorCustomer!.add(new VendorCustomer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vendorCustomer != null) {
      data['vendor_customer'] =
          this.vendorCustomer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorCustomer {
  var userId;
  var id;
  String? name;
  String? email;
  String? phone;
  var emailVerifiedAt;
  String? password;
  var ipAddress;
  var avatar;
  var status;
  var defaultAddressId;
  String? deviceToken;
  var fbId;
  var googleId;
  var isDeleted;
  var rememberToken;
  var createdAt;
  var updatedAt;
  Address? address;
  var totalOrders;
  String? totalOrderAmount;

  VendorCustomer(
      {this.userId,
        this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.password,
        this.ipAddress,
        this.avatar,
        this.status,
        this.defaultAddressId,
        this.deviceToken,
        this.fbId,
        this.googleId,
        this.isDeleted,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.address,
        this.totalOrders,
        this.totalOrderAmount});

  VendorCustomer.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    ipAddress = json['ip_address'];
    avatar = json['avatar'];
    status = json['status'];
    defaultAddressId = json['default_address_id'];
    deviceToken = json['device_token'];
    fbId = json['fb_id'];
    googleId = json['google_id'];
    isDeleted = json['is_deleted'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    totalOrders = json['total_orders'];
    totalOrderAmount = json['total_order_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['ip_address'] = this.ipAddress;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['default_address_id'] = this.defaultAddressId;
    data['device_token'] = this.deviceToken;
    data['fb_id'] = this.fbId;
    data['google_id'] = this.googleId;
    data['is_deleted'] = this.isDeleted;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['total_orders'] = this.totalOrders;
    data['total_order_amount'] = this.totalOrderAmount;
    return data;
  }
}

class Address {
  var id;
  var userId;
  String? shippingFirstName;
  String? shippingLastName;
  String? shippingAddress;
  var shippingDivision;
  var shippingDistrict;
  var shippingThana;
  var shippingUnion;
  String? shippingPostcode;
  String? shippingPhone;
  String? shippingEmail;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
        this.userId,
        this.shippingFirstName,
        this.shippingLastName,
        this.shippingAddress,
        this.shippingDivision,
        this.shippingDistrict,
        this.shippingThana,
        this.shippingUnion,
        this.shippingPostcode,
        this.shippingPhone,
        this.shippingEmail,
        this.createdAt,
        this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shippingFirstName = json['shipping_first_name'];
    shippingLastName = json['shipping_last_name'];
    shippingAddress = json['shipping_address'];
    shippingDivision = json['shipping_division'];
    shippingDistrict = json['shipping_district'];
    shippingThana = json['shipping_thana'];
    shippingUnion = json['shipping_union'];
    shippingPostcode = json['shipping_postcode'];
    shippingPhone = json['shipping_phone'];
    shippingEmail = json['shipping_email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shipping_first_name'] = this.shippingFirstName;
    data['shipping_last_name'] = this.shippingLastName;
    data['shipping_address'] = this.shippingAddress;
    data['shipping_division'] = this.shippingDivision;
    data['shipping_district'] = this.shippingDistrict;
    data['shipping_thana'] = this.shippingThana;
    data['shipping_union'] = this.shippingUnion;
    data['shipping_postcode'] = this.shippingPostcode;
    data['shipping_phone'] = this.shippingPhone;
    data['shipping_email'] = this.shippingEmail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}