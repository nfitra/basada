class JadwalModel {
  String? sId;
  String? sDay;
  String? sTime;
  String? sWeather;
  String? sWeatherIcon;

  JadwalModel(
      {this.sId, this.sDay, this.sTime, this.sWeather, this.sWeatherIcon});

  JadwalModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sDay = json['s_day'];
    sTime = json['s_time'];
    sWeather = json['s_weather'];
    sWeatherIcon = json['s_weather_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['s_day'] = this.sDay;
    data['s_time'] = this.sTime;
    data['s_weather'] = this.sWeather;
    data['s_weather_icon'] = this.sWeatherIcon;
    return data;
  }
}
