import 'package:intl/intl.dart';

class ForecastModel {
  String? cod;
  int? message;
  int? cnt;
  List<ListOfWeather> list = [];
  City? city;

  ForecastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    json['list'].forEach((element) {
      list.add(ListOfWeather.fromJson(element));
    });
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
}

class ListOfWeather {
  int? dt;
  DateTime? time;
  var d24;
  var timed;
  Main? main;
  List<Weather> weather = [];
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  dynamic pop;
  Sys? sys;
  String? dtTxt;
  Rain? rain;

  ListOfWeather.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    time = DateTime.fromMillisecondsSinceEpoch(json['dt'] *1000);
    d24 = DateFormat.E().format(time!);
    timed = DateFormat('d MMM').format(time!);



    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    json['weather'].forEach((element) {
      weather.add(Weather.fromJson(element));
    });
    clouds =
    json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  dynamic tempKf;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;



  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Wind {
  dynamic speed;
  int? deg;
  dynamic gust;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}

class Sys {
  String? pod;

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

class Rain {
  dynamic d3h;

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'];
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Coord {
  dynamic lat;
  dynamic lon;



  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
