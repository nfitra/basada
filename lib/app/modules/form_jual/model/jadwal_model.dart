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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['s_day'] = sDay;
    data['s_time'] = sTime;
    data['s_weather'] = sWeather;
    data['s_weather_icon'] = sWeatherIcon;
    return data;
  }
}
