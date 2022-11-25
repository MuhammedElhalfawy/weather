import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/home/home_screen.dart';
import 'package:weather_app/shared/cubit/cubit.dart';

import '../../shared/cubit/states.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Expanded(
                      child: Image(
                        image: AssetImage(
                          'assets/images/on_boarding.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Discover the Weather in Your City',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 35,
                          ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please Enter Your City';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if(formKey.currentState!.validate()){
                            WeatherCubit.get(context)
                                .getWeatherData(city: searchController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for the city',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
