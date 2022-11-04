class ProfileModel {
  String? sId;
  String? fkAuth;
  String? nName;
  String? nDob;
  String? nAddress;
  String? nCity;
  String? nProvince;
  String? nPostcode;
  String? nContact;
  String? nBalance;
  String? isExist;
  String? nStatus;
  String? nCreatedAt;

  ProfileModel(
      {this.sId,
      this.fkAuth,
      this.nName,
      this.nDob,
      this.nAddress,
      this.nCity,
      this.nProvince,
      this.nPostcode,
      this.nContact,
      this.nBalance,
      this.isExist,
      this.nStatus,
      this.nCreatedAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fkAuth = json['fk_auth'];
    nName = json['n_name'];
    nDob = json['n_dob'];
    nAddress = json['n_address'];
    nCity = json['n_city'];
    nProvince = json['n_province'];
    nPostcode = json['n_postcode'];
    nContact = json['n_contact'];
    nBalance = json['n_balance'];
    isExist = json['isExist'];
    nStatus = json['n_status'];
    nCreatedAt = json['n_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fk_auth'] = this.fkAuth;
    data['n_name'] = this.nName;
    data['n_dob'] = this.nDob;
    data['n_address'] = this.nAddress;
    data['n_city'] = this.nCity;
    data['n_province'] = this.nProvince;
    data['n_postcode'] = this.nPostcode;
    data['n_contact'] = this.nContact;
    data['n_balance'] = this.nBalance;
    data['isExist'] = this.isExist;
    data['n_status'] = this.nStatus;
    data['n_created_at'] = this.nCreatedAt;
    return data;
  }
}
