class CategoryModel {
  var id;
  var parentId;
  String? title;
  String? slug;
  var description;
  String? image;
  var icon;
  var showChildProducts;
  var hideOnMenu;
  var metaTitle;
  var metaKeyword;
  var metaDescription;
  var sortOrder;
  var isActive;
  var isDeleted;
  var createdAt;
  String? updatedAt;
  List<Categories>? categories;

  CategoryModel(
      {this.id,
        this.parentId,
        this.title,
        this.slug,
        this.description,
        this.image,
        this.icon,
        this.showChildProducts,
        this.hideOnMenu,
        this.metaTitle,
        this.metaKeyword,
        this.metaDescription,
        this.sortOrder,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.categories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image']??'';
    icon = json['icon']??'';
    showChildProducts = json['show_child_products'];
    hideOnMenu = json['hide_on_menu'];
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    sortOrder = json['sort_order'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['show_child_products'] = this.showChildProducts;
    data['hide_on_menu'] = this.hideOnMenu;
    data['meta_title'] = this.metaTitle;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['sort_order'] = this.sortOrder;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  var id;
  var parentId;
  String? title;
  String? slug;
  String? description;
  var image;
  var icon;
  var showChildProducts;
  var hideOnMenu;
  var metaTitle;
  var metaKeyword;
  var metaDescription;
  var sortOrder;
  var isActive;
  var isDeleted;
  String? createdAt;
  String? updatedAt;
  List<Categories>? categories;

  Categories(
      {this.id,
        this.parentId,
        this.title,
        this.slug,
        this.description,
        this.image,
        this.icon,
        this.showChildProducts,
        this.hideOnMenu,
        this.metaTitle,
        this.metaKeyword,
        this.metaDescription,
        this.sortOrder,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    icon = json['icon'];
    showChildProducts = json['show_child_products'];
    hideOnMenu = json['hide_on_menu'];
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    sortOrder = json['sort_order'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['show_child_products'] = this.showChildProducts;
    data['hide_on_menu'] = this.hideOnMenu;
    data['meta_title'] = this.metaTitle;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['sort_order'] = this.sortOrder;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}