class KategoriSampahModel {
  String? sId;
  String? kName;

  KategoriSampahModel({this.sId, this.kName});

  KategoriSampahModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    kName = json['k_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['k_name'] = this.kName;
    return data;
  }
}
