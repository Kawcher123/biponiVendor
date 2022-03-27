class OrderDetailsModel {
  Orders? orders;
  List<OrdersDetails>? ordersDetails;
  Customer? customer;
  Address? address;

  OrderDetailsModel(
      {this.orders, this.ordersDetails, this.customer, this.address});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    if (json['orders_details'] != null) {
      ordersDetails = <OrdersDetails>[];
      json['orders_details'].forEach((v) {
        ordersDetails!.add(new OrdersDetails.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    if (this.ordersDetails != null) {
      data['orders_details'] =
          this.ordersDetails!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Orders {
  var id;
  var userId;
  var addressId;
  String? paymentId;
  String? ipAddress;
  var note;
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
  OrderStatus? orderStatus;

  Orders(
      {this.id,
        this.userId,
        this.addressId,
        this.paymentId,
        this.ipAddress,
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
        this.orderStatus});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentId = json['payment_id'];
    ipAddress = json['ip_address'];
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
    orderStatus = json['order_status'] != null
        ? new OrderStatus.fromJson(json['order_status'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['payment_id'] = this.paymentId;
    data['ip_address'] = this.ipAddress;
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
    if (this.orderStatus != null) {
      data['order_status'] = this.orderStatus!.toJson();
    }
    return data;
  }
}

class OrderStatus {
  var id;
  String? title;
  String? colorCode;
  var createdAt;
  var updatedAt;

  OrderStatus(
      {this.id, this.title, this.colorCode, this.createdAt, this.updatedAt});

  OrderStatus.fromJson(Map<String, dynamic> json) {
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

class OrdersDetails {
  var id;
  var userId;
  var orderId;
  var productId;
  String? productSku;
  var productQty;
  var productOptions;
  String? shippingMethod;
  var shippingCost;
  String? price;
  var sellerId;
  String? status;
  var createdAt;
  var updatedAt;
  var detailsStatus;
  ProductDetails? productDetails;

  OrdersDetails(
      {this.id,
        this.userId,
        this.orderId,
        this.productId,
        this.productSku,
        this.productQty,
        this.productOptions,
        this.shippingMethod,
        this.shippingCost,
        this.price,
        this.sellerId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.detailsStatus,
        this.productDetails});

  OrdersDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productSku = json['product_sku'];
    productQty = json['product_qty'];
    productOptions = json['product_options'];
    shippingMethod = json['shipping_method'];
    shippingCost = json['shipping_cost'];
    price = json['price'];
    sellerId = json['seller_id'];
    status = json['status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detailsStatus = json['details_status'];
    productDetails = json['product_details'] != null
        ? new ProductDetails.fromJson(json['product_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['product_sku'] = this.productSku;
    data['product_qty'] = this.productQty;
    data['product_options'] = this.productOptions;
    data['shipping_method'] = this.shippingMethod;
    data['shipping_cost'] = this.shippingCost;
    data['price'] = this.price;
    data['seller_id'] = this.sellerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['details_status'] = this.detailsStatus;
    if (this.productDetails != null) {
      data['product_details'] = this.productDetails!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  var id;
  var brandId;
  String? brandTitle;
  String? categoryId;
  String? categoryTitle;
  String? productType;
  var attributeSetId;
  String? title;
  String? defaultImage;
  String? galleryImages;
  String? shortDescription;
  String? description;
  String? slug;
  String? price;
  var specialPrice;
  String? specialPriceType;
  var specialPriceStart;
  var specialPriceEnd;
  String? sku;
  var manageStock;
  var qty;
  var weight;
  String? weightUnit;
  var inStock;
  var viewed;
  var isApproximate;
  var isActive;
  var isDeleted;
  var sellerId;
  String? createdAt;
  String? updatedAt;

  ProductDetails(
      {this.id,
        this.brandId,
        this.brandTitle,
        this.categoryId,
        this.categoryTitle,
        this.productType,
        this.attributeSetId,
        this.title,
        this.defaultImage,
        this.galleryImages,
        this.shortDescription,
        this.description,
        this.slug,
        this.price,
        this.specialPrice,
        this.specialPriceType,
        this.specialPriceStart,
        this.specialPriceEnd,
        this.sku,
        this.manageStock,
        this.qty,
        this.weight,
        this.weightUnit,
        this.inStock,
        this.viewed,
        this.isApproximate,
        this.isActive,
        this.isDeleted,
        this.sellerId,
        this.createdAt,
        this.updatedAt});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    brandTitle = json['brand_title'];
    categoryId = json['category_id'];
    categoryTitle = json['category_title'];
    productType = json['product_type'];
    attributeSetId = json['attribute_set_id'];
    title = json['title'];
    defaultImage = json['default_image'];
    galleryImages = json['gallery_images'];
    shortDescription = json['short_description'];
    description = json['description'];
    slug = json['slug'];
    price = json['price'];
    specialPrice = json['special_price'];
    specialPriceType = json['special_price_type'];
    specialPriceStart = json['special_price_start'];
    specialPriceEnd = json['special_price_end'];
    sku = json['sku'];
    manageStock = json['manage_stock'];
    qty = json['qty'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inStock = json['in_stock'];
    viewed = json['viewed'];
    isApproximate = json['is_approximate'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    sellerId = json['seller_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_id'] = this.brandId;
    data['brand_title'] = this.brandTitle;
    data['category_id'] = this.categoryId;
    data['category_title'] = this.categoryTitle;
    data['product_type'] = this.productType;
    data['attribute_set_id'] = this.attributeSetId;
    data['title'] = this.title;
    data['default_image'] = this.defaultImage;
    data['gallery_images'] = this.galleryImages;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['special_price'] = this.specialPrice;
    data['special_price_type'] = this.specialPriceType;
    data['special_price_start'] = this.specialPriceStart;
    data['special_price_end'] = this.specialPriceEnd;
    data['sku'] = this.sku;
    data['manage_stock'] = this.manageStock;
    data['qty'] = this.qty;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['in_stock'] = this.inStock;
    data['viewed'] = this.viewed;
    data['is_approximate'] = this.isApproximate;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['seller_id'] = this.sellerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Customer {
  var id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  var ipAddress;
  var avatar;
  var status;
  var defaultAddressId;
  String? deviceToken;
  var isDeleted;
  var createdAt;
  var updatedAt;

  Customer(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.ipAddress,
        this.avatar,
        this.status,
        this.defaultAddressId,
        this.deviceToken,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    ipAddress = json['ip_address'];
    avatar = json['avatar'];
    status = json['status'];
    defaultAddressId = json['default_address_id'];
    deviceToken = json['device_token'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['ip_address'] = this.ipAddress;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['default_address_id'] = this.defaultAddressId;
    data['device_token'] = this.deviceToken;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Division? division;
  District? district;
  Upazila? upazila;
  Union? union;

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
        this.updatedAt,
        this.division,
        this.district,
        this.upazila,
        this.union});

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
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    upazila =
    json['upazila'] != null ? new Upazila.fromJson(json['upazila']) : null;
    union = json['union'] != null ? new Union.fromJson(json['union']) : null;
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
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.upazila != null) {
      data['upazila'] = this.upazila!.toJson();
    }
    if (this.union != null) {
      data['union'] = this.union!.toJson();
    }
    return data;
  }
}

class Division {
  var id;
  String? title;

  Division({this.id, this.title});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class District {
  var id;
  var divisionId;
  String? title;

  District({this.id, this.divisionId, this.title});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_id'] = this.divisionId;
    data['title'] = this.title;
    return data;
  }
}

class Upazila {
  var id;
  var districtId;
  String? title;
  var status;

  Upazila({this.id, this.districtId, this.title, this.status});

  Upazila.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['title'] = this.title;
    data['status'] = this.status;
    return data;
  }
}

class Union {
  var id;
  var upazilaId;
  String? title;
  var status;

  Union({this.id, this.upazilaId, this.title, this.status});

  Union.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    upazilaId = json['upazila_id'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['upazila_id'] = this.upazilaId;
    data['title'] = this.title;
    data['status'] = this.status;
    return data;
  }
}