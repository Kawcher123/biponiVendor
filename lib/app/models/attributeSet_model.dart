class AttributeSetModel {
  var id;
  String? title;
  String? description;
  String? attributeSetCode;
  String? attributeIds;
  var isActive;
  var isDeleted;
  var createdAt;
  String? updatedAt;
  List<Attribute>? attribute;

  AttributeSetModel(
      {this.id,
        this.title,
        this.description,
        this.attributeSetCode,
        this.attributeIds,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.attribute});

  AttributeSetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    attributeSetCode = json['attribute_set_code'];
    attributeIds = json['attribute_ids'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['attribute'] != null) {
      attribute = <Attribute>[];
      json['attribute'].forEach((v) {
        attribute!.add(new Attribute.fromJson(v));
      });
    }
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
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attribute {
  var id;
  String? title;
  String? attributeCode;
  List<AttributeValues>? attributeValues;
  String? placeholderText;
  String? description;
  String? catalogInputType;
  var isRequired;
  var showOnSpecification;
  var showOnAdvanceSearch;
  var showOnFilter;
  var isActive;
  var isDeleted;
  String? createdAt;
  String? updatedAt;

  Attribute(
      {this.id,
        this.title,
        this.attributeCode,
        this.attributeValues,
        this.placeholderText,
        this.description,
        this.catalogInputType,
        this.isRequired,
        this.showOnSpecification,
        this.showOnAdvanceSearch,
        this.showOnFilter,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    attributeCode = json['attribute_code'];
    if (json['attribute_values'] != null) {
      attributeValues = <AttributeValues>[];
      json['attribute_values'].forEach((v) {
        attributeValues!.add(new AttributeValues.fromJson(v));
      });
    }
    placeholderText = json['placeholder_text'];
    description = json['description'];
    catalogInputType = json['catalog_input_type'];
    isRequired = json['is_required'];
    showOnSpecification = json['show_on_specification'];
    showOnAdvanceSearch = json['show_on_advance_search'];
    showOnFilter = json['show_on_filter'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['attribute_code'] = this.attributeCode;
    if (this.attributeValues != null) {
      data['attribute_values'] =
          this.attributeValues!.map((v) => v.toJson()).toList();
    }
    data['placeholder_text'] = this.placeholderText;
    data['description'] = this.description;
    data['catalog_input_type'] = this.catalogInputType;
    data['is_required'] = this.isRequired;
    data['show_on_specification'] = this.showOnSpecification;
    data['show_on_advance_search'] = this.showOnAdvanceSearch;
    data['show_on_filter'] = this.showOnFilter;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AttributeValues {
  String? label;
  String? value;

  AttributeValues({this.label, this.value});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}