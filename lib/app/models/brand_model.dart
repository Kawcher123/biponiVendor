class BrandModel {
  var id;
  String? title;
  String? slug;
  var description;
  String? image;
  var icon;
  var metaTitle;
  var metaKeyword;
  var metaDescription;
  var isActive;
  var isDeleted;
  String? createdAt;
  String? updatedAt;

  BrandModel(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.image,
        this.icon,
        this.metaTitle,
        this.metaKeyword,
        this.metaDescription,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    icon = json['icon'];
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['meta_title'] = this.metaTitle;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}