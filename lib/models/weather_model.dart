class WeatherModel {
  CoordData? coord;
  List<WeatherData> weather = [];
  String? base;
  MainData? main;
  int? visibility;
  WindData? wind;
  CloudsData? clouds;
  int? dt;
  SysData? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherModel.fromJson(Map<String,dynamic> json) {
    coord = CoordData.fromJson(json['coord']);
    json['weather'].forEach((element) {
      weather.add(WeatherData.fromJson(element));
    });
    base = json['base'];
    main = MainData.fromJson(json['main']);
    visibility = json['visibility'];
    wind = WindData.fromJson(json['wind']);
    clouds = CloudsData.fromJson(json['clouds']);
    dt = json['dt'];
    sys = SysData.fromJson(json['sys']);
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];

  }
}

class CoordData {
  double? lon;
  double? lat;

  CoordData.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}

class WeatherData {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class MainData {
  dynamic temp;
  double? feelsLike;
  dynamic tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  MainData.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class WindData {
  dynamic speed;
  dynamic deg;

  WindData.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
}

class CloudsData {
  int? all;

  CloudsData.fromJson(Map<String,dynamic> json) {
    all = json['all'];
  }
}

class SysData {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysData.fromJson(Map<String,dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

// for(var i=1;i<8;i++){
// String day = DateFormat("EEEE").format(DateTime(date.year,date.month,date.day+i+1)).substring(0,3);
// var temp = res["daily"][i];
// var hourly = Weather(
// max:temp["temp"]["max"]?.round()??0,
// min:temp["temp"]["min"]?.round()??0,
// image:findIcon(temp["weather"][0]["main"].toString(), false),
// name:temp["weather"][0]["main"].toString(),
// day: day
// );
// sevenDay.add(hourly);
// }