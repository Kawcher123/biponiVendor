class OrderListModel {
  List<Orders>? orders;

  OrderListModel({this.orders});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  var id;
  var userId;
  var addressId;
  var paymentId;
  String? ipAddress;
  var email;
  String? note;
  String? paidAmount;
  String? discountAmount;
  var couponCode;
  var couponAmount;
  String? paymentMethod;
  var shippingCost;
  var status;
  var isDeleted;
  String? createdAt;
  String? updatedAt;
  var seller;
  Statuses? statuses;

  Orders(
      {this.id,
        this.userId,
        this.addressId,
        this.paymentId,
        this.ipAddress,
        this.email,
        this.note,
        this.paidAmount,
        this.discountAmount,
        this.couponCode,
        this.couponAmount,
        this.paymentMethod,
        this.shippingCost,
        this.status,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.seller,
        this.statuses});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentId = json['payment_id'];
    ipAddress = json['ip_address'];
    email = json['email'];
    note = json['note'];
    paidAmount = json['paid_amount'];
    discountAmount = json['discount_amount'];
    couponCode = json['coupon_code'];
    couponAmount = json['coupon_amount'];
    paymentMethod = json['payment_method'];
    shippingCost = json['shipping_cost'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seller = json['seller'];
    statuses = json['statuses'] != null
        ? new Statuses.fromJson(json['statuses'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['payment_id'] = this.paymentId;
    data['ip_address'] = this.ipAddress;
    data['email'] = this.email;
    data['note'] = this.note;
    data['paid_amount'] = this.paidAmount;
    data['discount_amount'] = this.discountAmount;
    data['coupon_code'] = this.couponCode;
    data['coupon_amount'] = this.couponAmount;
    data['payment_method'] = this.paymentMethod;
    data['shipping_cost'] = this.shippingCost;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['seller'] = this.seller;
    if (this.statuses != null) {
      data['statuses'] = this.statuses!.toJson();
    }
    return data;
  }
}

class Statuses {
  var id;
  String? title;
  String? colorCode;
  var createdAt;
  var updatedAt;

  Statuses(
      {this.id, this.title, this.colorCode, this.createdAt, this.updatedAt});

  Statuses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    colorCode = json['color_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color_code'] = this.colorCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}