import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/shared/cubit/states.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

import '../../models/forecast_model.dart';
import '../network/end_boint.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<int> weatherIndex = [];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(WeatherChangeBottomNavBarState());
  }

  WeatherModel? weatherModel;

  void getWeatherData({
    required String city,
  }) {
    emit(WeatherGetLoadingDataState());
    DioHelper.getData(
      url: WEATHER,
      query: {
        'q': city,
        'appid': '29600baccdcd682e06fbac1c2dbb375f',
        'units': 'metric',
      },
    ).then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      print(weatherModel!.name);

      emit(WeatherGetSuccessDataState());
    }).catchError((error) {
      print(error.toString());
      emit(WeatherGetErrorDataState());
    });
  }

  ForecastModel? forecastModel;

  void getForecastData({
    required String city,
  }) {
    emit(WeatherGetForecastLoadingDataState());
    DioHelper.getData(
      url: FORECAST,
      query: {
        'q': city,
        'appid': '29600baccdcd682e06fbac1c2dbb375f',
        'units': 'metric',
      },
    ).then((value) {
      forecastModel = ForecastModel.fromJson(value.data);
      //print(forecastModel!.city!.name);

      emit(WeatherGetForecastSuccessDataState());
    }).catchError((error) {
      print(error.toString());
      emit(WeatherGetForecastErrorDataState());
    });
  }

// WeatherModelData? weatherModelData;
//
// void getWeatherData({
//   required String city,
// }) {
//   emit(WeatherGetLoadingDataState());
//   DioHelper.getData(
//     url: WEATHER,
//     query: {
//       'q': city,
//       'key': '3c0d76635f434b98837160808221009',
//       'days': '5',
//     },
//   ).then((value) {
//     weatherModelData = WeatherModelData.fromJson(value.data);
//     print(weatherModelData!.location!.name);
//
//     emit(WeatherGetSuccessDataState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(WeatherGetErrorDataState());
//   });
// }
}
