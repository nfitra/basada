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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['a_title'] = this.aTitle;
    data['a_content'] = this.aContent;
    data['k_name'] = this.kName;
    data['a_file'] = this.aFile;
    data['a_file_type'] = this.aFileType;
    return data;
  }
}
