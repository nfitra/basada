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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['un_name'] = unName;
    data['fk_auth'] = fkAuth;
    data['_id'] = sId;
    data['isActive'] = isActive;
    return data;
  }
}
