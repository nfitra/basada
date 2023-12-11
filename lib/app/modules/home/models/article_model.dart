class ArticleModel {
  String? sId;
  String? aTitle;
  String? aContent;
  String? kName;
  String? aFile;
  String? aFileType;

  ArticleModel(
      {this.sId,
      this.aTitle,
      this.aContent,
      this.kName,
      this.aFile,
      this.aFileType});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    aTitle = json['a_title'];
    aContent = json['a_content'];
    kName = json['k_name'];
    aFile = json['a_file'];
    aFileType = json['a_file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['a_title'] = aTitle;
    data['a_content'] = aContent;
    data['k_name'] = kName;
    data['a_file'] = aFile;
    data['a_file_type'] = aFileType;
    return data;
  }
}
