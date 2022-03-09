class AddProductModel {
  String? title;
  String? weight;
  String? weightUnit;
  String? shortDescription;
  String? description;
  String? brandId;
  String? categoryId;
  String? price;
  String? inStock;
  String? sku;
  String? slug;
  String? isApproximate;
  String? brandTitle;
  String? productType;
  String? attributeSetId;
  String? categoryTitle;
  String? specialPrice;
  String? specialPriceType;
  String? specialPriceStart;
  String? specialPriceEnd;
  String? defaultImage;
  String? galleryImage;
  String? manageStock;
  String? qty;
  String? viewed;
  String? isActive;
  String? maxCartQty;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? shippingOptionInsideOriginInsideAllowFreeShipping;
  String? shippingOptionInsideOriginInsideStandardShipping;
  String? shippingOptionInsideOriginInsideExpressShipping;
  String? shippingOptionOutsideOriginOutsideAllowFreeShipping;
  String? shippingOptionOutsideOriginOutsideStandardShipping;
  String? shippingOptionOutsideOriginOutsideExpressShipping;
  String? miscellaneousInformationAllowCashOnDelivery;
  String? miscellaneousInformationWarrentyPeriod;
  String? miscellaneousInformationAllowChangeOfMind;

  AddProductModel(
      {this.title,
        this.weight,
        this.weightUnit,
        this.shortDescription,
        this.description,
        this.brandId,
        this.categoryId,
        this.price,
        this.inStock,
        this.sku,
        this.slug,
        this.isApproximate,
        this.brandTitle,
        this.productType,
        this.attributeSetId,
        this.categoryTitle,
        this.specialPrice,
        this.specialPriceType,
        this.specialPriceStart,
        this.specialPriceEnd,
        this.defaultImage,
        this.galleryImage,
        this.manageStock,
        this.qty,
        this.viewed,
        this.isActive,
        this.maxCartQty,
        this.metaTitle,
        this.metaKeyword,
        this.metaDescription,
        this.shippingOptionInsideOriginInsideAllowFreeShipping,
        this.shippingOptionInsideOriginInsideStandardShipping,
        this.shippingOptionInsideOriginInsideExpressShipping,
        this.shippingOptionOutsideOriginOutsideAllowFreeShipping,
        this.shippingOptionOutsideOriginOutsideStandardShipping,
        this.shippingOptionOutsideOriginOutsideExpressShipping,
        this.miscellaneousInformationAllowCashOnDelivery,
        this.miscellaneousInformationWarrentyPeriod,
        this.miscellaneousInformationAllowChangeOfMind});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    shortDescription = json['short_description'];
    description = json['description'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    price = json['price'];
    inStock = json['in_stock'];
    sku = json['sku'];
    slug = json['slug'];
    isApproximate = json['is_approximate'];
    brandTitle = json['brand_title'];
    productType = json['product_type'];
    attributeSetId = json['attribute_set_id'];
    categoryTitle = json['category_title'];
    specialPrice = json['special_price'];
    specialPriceType = json['special_price_type'];
    specialPriceStart = json['special_price_start'];
    specialPriceEnd = json['special_price_end'];
    defaultImage = json['default_image'];
    defaultImage = json['gallery_images'];
    manageStock = json['manage_stock'];
    qty = json['qty'];
    viewed = json['viewed'];
    isActive = json['is_active'];
    maxCartQty = json['max_cart_qty'];
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    shippingOptionInsideOriginInsideAllowFreeShipping =
    json['shipping_option[inside_origin][inside_allow_free_shipping]'];
    shippingOptionInsideOriginInsideStandardShipping =
    json['shipping_option[inside_origin][inside_standard_shipping]'];
    shippingOptionInsideOriginInsideExpressShipping =
    json['shipping_option[inside_origin][inside_express_shipping]'];
    shippingOptionOutsideOriginOutsideAllowFreeShipping =
    json['shipping_option[outside_origin][outside_allow_free_shipping]'];
    shippingOptionOutsideOriginOutsideStandardShipping =
    json['shipping_option[outside_origin][outside_standard_shipping]'];
    shippingOptionOutsideOriginOutsideExpressShipping =
    json['shipping_option[outside_origin][outside_express_shipping]'];
    miscellaneousInformationAllowCashOnDelivery =
    json['miscellaneous_information[allow_cash_on_delivery]'];
    miscellaneousInformationWarrentyPeriod =
    json['miscellaneous_information[warrenty_period]'];
    miscellaneousInformationAllowChangeOfMind =
    json['miscellaneous_information[allow_change_of_mind]'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['brand_id'] = this.brandId;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['in_stock'] = this.inStock;
    data['sku'] = this.sku;
    data['slug'] = this.slug;
    data['is_approximate'] = this.isApproximate;
    data['brand_title'] = this.brandTitle;
    data['product_type'] = this.productType;
    data['attribute_set_id'] = this.attributeSetId;
    data['category_title'] = this.categoryTitle;
    data['special_price'] = this.specialPrice;
    data['special_price_type'] = this.specialPriceType;
    data['special_price_start'] = this.specialPriceStart;
    data['special_price_end'] = this.specialPriceEnd;
    data['default_image'] = this.defaultImage;
    data['gallery_images'] = this.galleryImage;
    data['manage_stock'] = this.manageStock;
    data['qty'] = this.qty;
    data['viewed'] = this.viewed;
    data['is_active'] = this.isActive;
    data['max_cart_qty'] = this.maxCartQty;
    data['meta_title'] = this.metaTitle;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['shipping_option[inside_origin][inside_allow_free_shipping]'] =
        this.shippingOptionInsideOriginInsideAllowFreeShipping;
    data['shipping_option[inside_origin][inside_standard_shipping]'] =
        this.shippingOptionInsideOriginInsideStandardShipping;
    data['shipping_option[inside_origin][inside_express_shipping]'] =
        this.shippingOptionInsideOriginInsideExpressShipping;
    data['shipping_option[outside_origin][outside_allow_free_shipping]'] =
        this.shippingOptionOutsideOriginOutsideAllowFreeShipping;
    data['shipping_option[outside_origin][outside_standard_shipping]'] =
        this.shippingOptionOutsideOriginOutsideStandardShipping;
    data['shipping_option[outside_origin][outside_express_shipping]'] =
        this.shippingOptionOutsideOriginOutsideExpressShipping;
    data['miscellaneous_information[allow_cash_on_delivery]'] =
        this.miscellaneousInformationAllowCashOnDelivery;
    data['miscellaneous_information[warrenty_period]'] =
        this.miscellaneousInformationWarrentyPeriod;
    data['miscellaneous_information[allow_change_of_mind]'] =
        this.miscellaneousInformationAllowChangeOfMind;
    return data;
  }
}