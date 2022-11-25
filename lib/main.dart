import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/home/home_screen.dart';
import 'package:weather_app/shared/bloc_observer.dart';
import 'package:weather_app/shared/cubit/cubit.dart';
import 'package:weather_app/shared/cubit/states.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';
import 'package:weather_app/shared/style/colors.dart';

import 'modules/first_screen/first_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      child: BlocConsumer<WeatherCubit, WeatherStates>(
       listener: (context, state) {},
       builder: (context, state) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           darkTheme: ThemeData(
             //scaffoldBackgroundColor: const Color(0xff070809),
             scaffoldBackgroundColor: ConstantColor.defaultDartColor,
             appBarTheme: const AppBarTheme(
               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: ConstantColor.defaultDartColor,
                 statusBarIconBrightness: Brightness.light,
               ),
               backgroundColor: ConstantColor.defaultDartColor,
               elevation: 0.0,
               centerTitle: true,
               titleTextStyle: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'Outfit',
               ),
             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontSize: 20.0,
                 //fontWeight: FontWeight.w600,
                 color: Colors.white,
               ),
               subtitle1: TextStyle(
                   fontSize: 16.0,
                   //fontWeight: FontWeight.w600,
                   color: Colors.white,
                   height: 1.3
               ),
             ),
             fontFamily: 'Avenirl',
           ),
           themeMode: ThemeMode.dark,
           home: FirstScreen(),
         );
       },
      ),
    );
  }
}
