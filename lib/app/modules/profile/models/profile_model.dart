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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fk_auth'] = fkAuth;
    data['n_name'] = nName;
    data['n_dob'] = nDob;
    data['n_address'] = nAddress;
    data['n_city'] = nCity;
    data['n_province'] = nProvince;
    data['n_postcode'] = nPostcode;
    data['n_contact'] = nContact;
    data['n_balance'] = nBalance;
    data['isExist'] = isExist;
    data['n_status'] = nStatus;
    data['n_created_at'] = nCreatedAt;
    return data;
  }
}
