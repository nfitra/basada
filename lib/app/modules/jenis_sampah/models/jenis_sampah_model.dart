class JenisSampahModel {
  String? sId;
  String? jName;
  String? jPrice;
  String? hargaPelapak;
  String? satuan;
  String? jImage;
  String? fkKategori;

  JenisSampahModel(
      {this.sId,
      this.jName,
      this.jPrice,
      this.hargaPelapak,
      this.satuan,
      this.jImage,
      this.fkKategori});

  JenisSampahModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jName = json['j_name'];
    jPrice = json['j_price'];
    hargaPelapak = json['harga_pelapak'];
    satuan = json['satuan'];
    jImage = json['j_image'];
    fkKategori = json['fk_kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['j_name'] = jName;
    data['j_price'] = jPrice;
    data['harga_pelapak'] = hargaPelapak;
    data['satuan'] = satuan;
    data['j_image'] = jImage;
    data['fk_kategori'] = fkKategori;
    return data;
  }
}
