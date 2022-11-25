// import 'package:intl/intl.dart';
//
// class WeatherModelData {
//   Location? location;
//   Current? current;
//   Forecast? forecast;
//
//   WeatherModelData.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null
//         ? Location.fromJson(json['location'])
//         : null;
//     current =
//     json['current'] != null ? Current.fromJson(json['current']) : null;
//     forecast = json['forecast'] != null
//         ? Forecast.fromJson(json['forecast'])
//         : null;
//   }
// }
//
// class Location {
//   String? name;
//   String? region;
//   String? country;
//   double? lat;
//   double? lon;
//   String? tzId;
//   int? localtimeEpoch;
//   String? localtime;
//
//
//   Location.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     region = json['region'];
//     country = json['country'];
//     lat = json['lat'];
//     lon = json['lon'];
//     tzId = json['tz_id'];
//     localtimeEpoch = json['localtime_epoch'];
//     localtime = json['localtime'];
//   }
// }
//
// class Current {
//   int? lastUpdatedEpoch;
//   String? lastUpdated;
//   dynamic tempC;
//   dynamic tempF;
//   int? isDay;
//   Condition? condition;
//   dynamic windMph;
//   dynamic windKph;
//   dynamic windDegree;
//   String? windDir;
//   dynamic pressureMb;
//   dynamic pressureIn;
//   dynamic precipMm;
//   dynamic precipIn;
//   dynamic humidity;
//   dynamic cloud;
//   dynamic feelslikeC;
//   dynamic feelslikeF;
//   dynamic visKm;
//   dynamic visMiles;
//   dynamic uv;
//   dynamic gustMph;
//   dynamic gustKph;
//
//   Current.fromJson(Map<String, dynamic> json) {
//     lastUpdatedEpoch = json['last_updated_epoch'];
//     lastUpdated = json['last_updated'];
//     tempC = json['temp_c'];
//     tempF = json['temp_f'];
//     isDay = json['is_day'];
//     condition = json['condition'] != null
//         ? Condition.fromJson(json['condition'])
//         : null;
//     windMph = json['wind_mph'];
//     windKph = json['wind_kph'];
//     windDegree = json['wind_degree'];
//     windDir = json['wind_dir'];
//     pressureMb = json['pressure_mb'];
//     pressureIn = json['pressure_in'];
//     precipMm = json['precip_mm'];
//     precipIn = json['precip_in'];
//     humidity = json['humidity'];
//     cloud = json['cloud'];
//     feelslikeC = json['feelslike_c'];
//     feelslikeF = json['feelslike_f'];
//     visKm = json['vis_km'];
//     visMiles = json['vis_miles'];
//     uv = json['uv'];
//     gustMph = json['gust_mph'];
//     gustKph = json['gust_kph'];
//   }
// }
//
// class Condition {
//   String? text;
//   String? icon;
//   int? code;
//
//
//   Condition.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     icon = json['icon'];
//     code = json['code'];
//   }
// }
//
// class Forecast {
//   List<ForecastDay> forecastday = [];
//
//   Forecast.fromJson(Map<String, dynamic> json) {
//     json['forecastday'].forEach((element) {
//       forecastday.add(ForecastDay.fromJson(element));
//     });
//   }
// }
//
// class ForecastDay {
//   String? date;
//   int? dateEpoch;
//   DateTime? time;
//   var d24;
//   var timed;
//   Day? day;
//   Astro? astro;
//   List<Hour> hour = [];
//
//
//   ForecastDay.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     dateEpoch = json['date_epoch'];
//     time = DateTime.fromMillisecondsSinceEpoch(json['date_epoch'] *1000);
//     d24 = DateFormat.E().format(DateTime(time!.year, time!.month, time!.day+1));
//     timed = DateFormat('d MMM').format(time!);
//
//     day = json['day'] != null ? Day.fromJson(json['day']) : null;
//     astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
//     json['hour'].forEach((element) {
//       hour.add(Hour.fromJson(element));
//     });
//   }
// }
//
// class Day {
//   dynamic maxTempC;
//   dynamic maxTempF;
//   dynamic minTempC;
//   dynamic minTempF;
//   dynamic avgTempC;
//   dynamic avgTempF;
//   dynamic maxWindMph;
//   dynamic maxWindKph;
//   dynamic totalprecipMm;
//   dynamic totalprecipIn;
//   dynamic avgvisKm;
//   dynamic avgvisMiles;
//   dynamic avghumidity;
//   dynamic dailyWillItRain;
//   dynamic dailyChanceOfRain;
//   dynamic dailyWillItSnow;
//   dynamic dailyChanceOfSnow;
//   Condition? condition;
//   dynamic uv;
//
//   Day.fromJson(Map<String, dynamic> json) {
//     maxTempC = json['maxtemp_c'];
//     maxTempF = json['maxtemp_f'];
//     minTempC = json['mintemp_c'];
//     minTempF = json['mintemp_f'];
//     avgTempC = json['avgtemp_c'];
//     avgTempF = json['avgtemp_f'];
//     maxWindMph = json['maxwind_mph'];
//     maxWindKph = json['maxwind_kph'];
//     totalprecipMm = json['totalprecip_mm'];
//     totalprecipIn = json['totalprecip_in'];
//     avgvisKm = json['avgvis_km'];
//     avgvisMiles = json['avgvis_miles'];
//     avghumidity = json['avghumidity'];
//     dailyWillItRain = json['daily_will_it_rain'];
//     dailyChanceOfRain = json['daily_chance_of_rain'];
//     dailyWillItSnow = json['daily_will_it_snow'];
//     dailyChanceOfSnow = json['daily_chance_of_snow'];
//     condition = json['condition'] != null
//         ? Condition.fromJson(json['condition'])
//         : null;
//     uv = json['uv'];
//   }
// }
//
// class Astro {
//   String? sunrise;
//   String? sunset;
//   String? moonrise;
//   String? moonset;
//   String? moonPhase;
//   String? moonIllumination;
//
//   Astro.fromJson(Map<String, dynamic> json) {
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//     moonrise = json['moonrise'];
//     moonset = json['moonset'];
//     moonPhase = json['moon_phase'];
//     moonIllumination = json['moon_illumination'];
//   }
// }
//
// class Hour {
//   int? timeEpoch;
//   String? time;
//   dynamic tempC;
//   dynamic tempF;
//   int? isDay;
//   Condition? condition;
//   dynamic windMph;
//   dynamic windKph;
//   dynamic windDegree;
//   String? windDir;
//   dynamic pressureMb;
//   dynamic pressureIn;
//   dynamic precipMm;
//   dynamic precipIn;
//   dynamic humidity;
//   dynamic cloud;
//   dynamic feelslikeC;
//   dynamic feelslikeF;
//   dynamic windchillC;
//   dynamic windchillF;
//   dynamic heatindexC;
//   dynamic heatindexF;
//   dynamic dewpointC;
//   dynamic dewpointF;
//   dynamic willItRain;
//   dynamic chanceOfRain;
//   dynamic willItSnow;
//   dynamic chanceOfSnow;
//   dynamic visKm;
//   dynamic visMiles;
//   dynamic gustMph;
//   dynamic gustKph;
//   dynamic uv;
//
//   Hour.fromJson(Map<String, dynamic> json) {
//     timeEpoch = json['time_epoch'];
//     time = json['time'];
//     tempC = json['temp_c'];
//     tempF = json['temp_f'];
//     isDay = json['is_day'];
//     condition = json['condition'] != null
//         ? Condition.fromJson(json['condition'])
//         : null;
//     windMph = json['wind_mph'];
//     windKph = json['wind_kph'];
//     windDegree = json['wind_degree'];
//     windDir = json['wind_dir'];
//     pressureMb = json['pressure_mb'];
//     pressureIn = json['pressure_in'];
//     precipMm = json['precip_mm'];
//     precipIn = json['precip_in'];
//     humidity = json['humidity'];
//     cloud = json['cloud'];
//     feelslikeC = json['feelslike_c'];
//     feelslikeF = json['feelslike_f'];
//     windchillC = json['windchill_c'];
//     windchillF = json['windchill_f'];
//     heatindexC = json['heatindex_c'];
//     heatindexF = json['heatindex_f'];
//     dewpointC = json['dewpoint_c'];
//     dewpointF = json['dewpoint_f'];
//     willItRain = json['will_it_rain'];
//     chanceOfRain = json['chance_of_rain'];
//     willItSnow = json['will_it_snow'];
//     chanceOfSnow = json['chance_of_snow'];
//     visKm = json['vis_km'];
//     visMiles = json['vis_miles'];
//     gustMph = json['gust_mph'];
//     gustKph = json['gust_kph'];
//     uv = json['uv'];
//   }
//
//
// }
