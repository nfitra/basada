class AdminModel {
  String? unName;
  String? fkAuth;
  String? sId;
  String? isActive;

  AdminModel({this.unName, this.fkAuth, this.sId, this.isActive});

  AdminModel.fromJson(Map<String, dynamic> json) {
    unName = json['un_name'];
    fkAuth = json['fk_auth'];
    sId = json['_id'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['un_name'] = this.unName;
    data['fk_auth'] = this.fkAuth;
    data['_id'] = this.sId;
    data['isActive'] = this.isActive;
    return data;
  }
}
