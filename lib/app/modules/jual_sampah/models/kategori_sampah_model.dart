class KategoriSampahModel {
  String? sId;
  String? kName;
  String? kImage;

  KategoriSampahModel({this.sId, this.kName, this.kImage});

  KategoriSampahModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    kName = json['k_name'];
    kImage = json['k_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['k_name'] = kName;
    data['k_image'] = kImage;
    return data;
  }
}
