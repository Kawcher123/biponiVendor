class ProductListModel {
  int? user;
  List<Product>? product;

  ProductListModel({this.user, this.product});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
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

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    brandTitle = json['brand_title'];
    categoryId = json['category_id'];
    categoryTitle = json['category_title'];
    productType = json['product_type'];
    attributeSetId = json['attribute_set_id'];
    title = json['title'];
    defaultImage = json['default_image']??'';
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