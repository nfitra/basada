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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['j_name'] = this.jName;
    data['j_price'] = this.jPrice;
    data['harga_pelapak'] = this.hargaPelapak;
    data['satuan'] = this.satuan;
    data['j_image'] = this.jImage;
    data['fk_kategori'] = this.fkKategori;
    return data;
  }
}
