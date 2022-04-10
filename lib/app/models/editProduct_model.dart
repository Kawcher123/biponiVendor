class EditProductModel {
  Product? product;
  ProductShipping? productShipping;
  MiscellaneousInfo? productMiscellaneousInfo;
  Specification? specification;

  EditProductModel({this.product, this.productShipping, this.productMiscellaneousInfo, this.specification});

  EditProductModel.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['meta'] != null) {
      json['meta'].forEach((v) {
        if (v['meta_key'] == 'product_shipping_option') {
          productShipping = ProductShipping.fromJson(v);
        }
        if (v['meta_key'] == 'product_miscellaneous_information') {
          productMiscellaneousInfo = MiscellaneousInfo.fromJson(v);
        }
        if (v['meta_key'] == 'product_sepecification') {
          specification = Specification.fromJson(v);
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }

    return data;
  }
}

class Product {
  var id;
  var brandId;
  String? brandTitle;
  String? categoryId;
  String? categoryTitle;
  String? productType;
  var attributeSetId;
  String? title;
  String? defaultImage;
  var galleryImages;
  String? shortDescription;
  String? description;
  String? slug;
  String? price;
  String? specialPrice;
  String? specialPriceType;
  var specialPriceStart;
  var specialPriceEnd;
  String? sku;
  var manageStock;
  var qty;
  var maxCartQty;
  var weight;
  String? weightUnit;
  var inStock;
  var viewed;
  var isApproximate;
  bool? isActive;
  var isDeleted;
  var sellerId;
  String? createdAt;
  String? updatedAt;
  String? categoryImage;
  Attributes? attributes;

  Product({
    this.id,
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
    this.maxCartQty,
    this.weight,
    this.weightUnit,
    this.inStock,
    this.viewed,
    this.isApproximate,
    this.isActive,
    this.isDeleted,
    this.sellerId,
    this.createdAt,
    this.updatedAt,
    this.categoryImage,
    this.attributes,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    brandTitle = json['brand_title'];
    categoryId = json['category_id'] ?? '';
    categoryTitle = json['category_title'];
    productType = json['product_type'];
    attributeSetId = json['attribute_set_id'] ?? '';
    title = json['title'];
    defaultImage = json['default_image'];
    galleryImages = json['gallery_images'];
    shortDescription = json['short_description'];
    description = json['description'];
    slug = json['slug'];
    price = json['price'];
    specialPrice = json['special_price'] ?? '0';
    specialPriceType = json['special_price_type'];
    specialPriceStart = json['special_price_start'];
    specialPriceEnd = json['special_price_end'];
    sku = json['sku'];
    manageStock = json['manage_stock'];
    qty = json['qty'];
    maxCartQty = json['max_cart_qty'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inStock = json['in_stock'];
    viewed = json['viewed'];
    isApproximate = json['is_approximate'];
    isActive = json['is_active'] == 1 ? true : false;
    isDeleted = json['is_deleted'];
    sellerId = json['seller_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryImage = json['category_image'] ?? '';
    attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
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
    data['max_cart_qty'] = this.maxCartQty;
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
    data['category_image'] = this.categoryImage;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  var id;
  String? title;
  var description;
  String? attributeSetCode;
  String? attributeIds;
  var isActive;
  var isDeleted;
  String? createdAt;
  String? updatedAt;

  Attributes({this.id, this.title, this.description, this.attributeSetCode, this.attributeIds, this.isActive, this.isDeleted, this.createdAt, this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    attributeSetCode = json['attribute_set_code'];
    attributeIds = json['attribute_ids'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['attribute_set_code'] = this.attributeSetCode;
    data['attribute_ids'] = this.attributeIds;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class Meta {
//   var id;
//   var productId;
//   String? metaKey;
//   String? metaValue;
//   String? createdAt;
//   String? updatedAt;
//   MetaValues? metaValues;
//
//   Meta(
//       {this.id,
//         this.productId,
//         this.metaKey,
//         this.metaValue,
//         this.createdAt,
//         this.updatedAt,
//         this.metaValues});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     metaKey = json['meta_key'];
//     metaValue = json['meta_value'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     metaValues = json['meta_values'] != null
//         ? new MetaValues.fromJson(json['meta_values'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['meta_key'] = this.metaKey;
//     data['meta_value'] = this.metaValue;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.metaValues != null) {
//       data['meta_values'] = this.metaValues!.toJson();
//     }
//     return data;
//   }
// }
//
// class MetaValues {
//   InsideOrigin? insideOrigin;
//   OutsideOrigin? outsideOrigin;
//   String? allowCashOnDelivery;
//   String? warrentyPeriod;
//   String? allowChangeOfMind;
//
//   MetaValues(
//       {this.insideOrigin,
//         this.outsideOrigin,
//         this.allowCashOnDelivery,
//         this.warrentyPeriod,
//         this.allowChangeOfMind});
//
//   MetaValues.fromJson(Map<String, dynamic> json) {
//     insideOrigin = json['inside_origin'] != null
//         ? new InsideOrigin.fromJson(json['inside_origin'])
//         : null;
//     outsideOrigin = json['outside_origin'] != null
//         ? new OutsideOrigin.fromJson(json['outside_origin'])
//         : null;
//     allowCashOnDelivery = json['allow_cash_on_delivery'];
//     warrentyPeriod = json['warrenty_period'];
//     allowChangeOfMind = json['allow_change_of_mind'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.insideOrigin != null) {
//       data['inside_origin'] = this.insideOrigin!.toJson();
//     }
//     if (this.outsideOrigin != null) {
//       data['outside_origin'] = this.outsideOrigin!.toJson();
//     }
//     data['allow_cash_on_delivery'] = this.allowCashOnDelivery;
//     data['warrenty_period'] = this.warrentyPeriod;
//     data['allow_change_of_mind'] = this.allowChangeOfMind;
//     return data;
//   }
// }
//
// class InsideOrigin {
//   String? insideAllowFreeShipping;
//   String? insideStandardShipping;
//   String? insideExpressShipping;
//
//   InsideOrigin(
//       {this.insideAllowFreeShipping,
//         this.insideStandardShipping,
//         this.insideExpressShipping});
//
//   InsideOrigin.fromJson(Map<String, dynamic> json) {
//     insideAllowFreeShipping = json['inside_allow_free_shipping'];
//     insideStandardShipping = json['inside_standard_shipping'];
//     insideExpressShipping = json['inside_express_shipping'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['inside_allow_free_shipping'] = this.insideAllowFreeShipping;
//     data['inside_standard_shipping'] = this.insideStandardShipping;
//     data['inside_express_shipping'] = this.insideExpressShipping;
//     return data;
//   }
// }
//
// class OutsideOrigin {
//   String? outsideAllowFreeShipping;
//   String? outsideStandardShipping;
//   String? outsideExpressShipping;
//
//   OutsideOrigin(
//       {this.outsideAllowFreeShipping,
//         this.outsideStandardShipping,
//         this.outsideExpressShipping});
//
//   OutsideOrigin.fromJson(Map<String, dynamic> json) {
//     outsideAllowFreeShipping = json['outside_allow_free_shipping'];
//     outsideStandardShipping = json['outside_standard_shipping'];
//     outsideExpressShipping = json['outside_express_shipping'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['outside_allow_free_shipping'] = this.outsideAllowFreeShipping;
//     data['outside_standard_shipping'] = this.outsideStandardShipping;
//     data['outside_express_shipping'] = this.outsideExpressShipping;
//     return data;
//   }
//
// }

class Specification {
  var id;
  var productId;
  String? metaKey;
  String? metaValue;
  String? createdAt;
  String? updatedAt;
  SpecificationMetaValues? metaValues;

  Specification({this.id, this.productId, this.metaKey, this.metaValue, this.createdAt, this.updatedAt, this.metaValues});

  Specification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    metaKey = json['meta_key'];
    metaValue = json['meta_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    metaValues = json['meta_values'] != null ? new SpecificationMetaValues.fromJson(json['meta_values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['meta_key'] = this.metaKey;
    data['meta_value'] = this.metaValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.metaValues != null) {
      data['meta_values'] = this.metaValues!.toJson();
    }
    return data;
  }
}

class SpecificationMetaValues {
  var mobileColor;
  var mobileDisplay;
  var mobileNetwork;

  SpecificationMetaValues({this.mobileColor, this.mobileDisplay, this.mobileNetwork});

  SpecificationMetaValues.fromJson(Map<String, dynamic> json) {
    mobileColor = json['mobile_color'];
    mobileDisplay = json['mobile_display'];
    mobileNetwork = json['mobile_network'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_color'] = this.mobileColor;
    data['mobile_display'] = this.mobileDisplay;
    data['mobile_network'] = this.mobileNetwork;
    return data;
  }
}

class ProductShipping {
  var id;
  var productId;
  String? metaKey;
  String? metaValue;
  String? createdAt;
  String? updatedAt;
  MetaValues? metaValues;

  ProductShipping({this.id, this.productId, this.metaKey, this.metaValue, this.createdAt, this.updatedAt, this.metaValues});

  ProductShipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    metaKey = json['meta_key'];
    metaValue = json['meta_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    metaValues = json['meta_values'] != null ? new MetaValues.fromJson(json['meta_values']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['meta_key'] = this.metaKey;
    data['meta_value'] = this.metaValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.metaValues != null) {
      data['meta_values'] = this.metaValues!.toJson();
    }
    return data;
  }
}

class MetaValues {
  InsideOrigin? insideOrigin;
  OutsideOrigin? outsideOrigin;

  MetaValues({this.insideOrigin, this.outsideOrigin});

  MetaValues.fromJson(Map<String, dynamic> json) {
    insideOrigin = json['inside_origin'] != null ? new InsideOrigin.fromJson(json['inside_origin']) : null;
    outsideOrigin = json['outside_origin'] != null ? new OutsideOrigin.fromJson(json['outside_origin']) : null;
    print('freeshipping1: ${insideOrigin!.insideAllowFreeShipping}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.insideOrigin != null) {
      data['inside_origin'] = this.insideOrigin!.toJson();
    }
    if (this.outsideOrigin != null) {
      data['outside_origin'] = this.outsideOrigin!.toJson();
    }
    return data;
  }
}

class InsideOrigin {
  String? insideAllowFreeShipping;
  String? insideStandardShipping;
  String? insideExpressShipping;

  InsideOrigin({this.insideAllowFreeShipping, this.insideStandardShipping, this.insideExpressShipping});

  InsideOrigin.fromJson(Map<String, dynamic> json) {
    insideAllowFreeShipping = json['inside_allow_free_shipping'];
    insideStandardShipping = json['inside_standard_shipping'];
    insideExpressShipping = json['inside_express_shipping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inside_allow_free_shipping'] = this.insideAllowFreeShipping;
    data['inside_standard_shipping'] = this.insideStandardShipping;
    data['inside_express_shipping'] = this.insideExpressShipping;
    return data;
  }
}

class OutsideOrigin {
  String? outsideAllowFreeShipping;
  String? outsideStandardShipping;
  String? outsideExpressShipping;

  OutsideOrigin({this.outsideAllowFreeShipping, this.outsideStandardShipping, this.outsideExpressShipping});

  OutsideOrigin.fromJson(Map<String, dynamic> json) {
    outsideAllowFreeShipping = json['outside_allow_free_shipping'];
    outsideStandardShipping = json['outside_standard_shipping'];
    outsideExpressShipping = json['outside_express_shipping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['outside_allow_free_shipping'] = this.outsideAllowFreeShipping;
    data['outside_standard_shipping'] = this.outsideStandardShipping;
    data['outside_express_shipping'] = this.outsideExpressShipping;
    return data;
  }
}

class MiscellaneousInfo {
  var id;
  var productId;
  String? metaKey;
  String? metaValue;
  String? createdAt;
  String? updatedAt;
  MiscellaneousMetaValues? metaValues;

  MiscellaneousInfo({this.id, this.productId, this.metaKey, this.metaValue, this.createdAt, this.updatedAt, this.metaValues});

  MiscellaneousInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    metaKey = json['meta_key'];
    metaValue = json['meta_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    metaValues = json['meta_values'] != null ? new MiscellaneousMetaValues.fromJson(json['meta_values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['meta_key'] = this.metaKey;
    data['meta_value'] = this.metaValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.metaValues != null) {
      data['meta_values'] = this.metaValues!.toJson();
    }
    return data;
  }
}

class MiscellaneousMetaValues {
  String? allowCashOnDelivery;
  String? warrentyPeriod;
  String? allowChangeOfMind;

  MiscellaneousMetaValues({this.allowCashOnDelivery, this.warrentyPeriod, this.allowChangeOfMind});

  MiscellaneousMetaValues.fromJson(Map<String, dynamic> json) {
    allowCashOnDelivery = json['allow_cash_on_delivery'];
    warrentyPeriod = json['warrenty_period'];
    allowChangeOfMind = json['allow_change_of_mind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_cash_on_delivery'] = this.allowCashOnDelivery;
    data['warrenty_period'] = this.warrentyPeriod;
    data['allow_change_of_mind'] = this.allowChangeOfMind;
    return data;
  }
}
