class RegistrationModel {
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? nidFrontSide;
  String? nidBackSide;
  String? password;
  String? shopName;
  String? slug;
  String? shopPhone;
  String? shopEmail;
  String? shopLogo;
  String? tradeLicense;
  String? division;
  String? district;
  String? area;
  String? address;
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? routingNumber;
  String? bkash;
  String? rocket;
  String? nagad;
  String? upay;

  RegistrationModel(
      {this.name,
        this.email,
        this.phone,
        this.avatar,
        this.nidFrontSide,
        this.nidBackSide,
        this.password,
        this.shopName,
        this.slug,
        this.shopPhone,
        this.shopEmail,
        this.shopLogo,
        this.tradeLicense,
        this.division,
        this.district,
        this.area,
        this.address,
        this.bankName,
        this.accountName,
        this.accountNumber,
        this.routingNumber,
        this.bkash,
        this.rocket,
        this.nagad,
        this.upay});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    nidFrontSide = json['nid_front_side'];
    nidBackSide = json['nid_back_side'];
    password = json['password'];
    shopName = json['shop_name'];
    slug = json['slug'];
    shopPhone = json['shop_phone'];
    shopEmail = json['shop_email'];
    shopLogo = json['shop_logo'];
    tradeLicense = json['trade_license'];
    division = json['division'];
    district = json['district'];
    area = json['area'];
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
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['nid_front_side'] = this.nidFrontSide;
    data['nid_back_side'] = this.nidBackSide;
    data['password'] = this.password;
    data['shop_name'] = this.shopName;
    data['slug'] = this.slug;
    data['shop_phone'] = this.shopPhone;
    data['shop_email'] = this.shopEmail;
    data['shop_logo'] = this.shopLogo;
    data['trade_license'] = this.tradeLicense;
    data['division'] = this.division;
    data['district'] = this.district;
    data['area'] = this.area;
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