import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';

class ForeCastScreen extends StatelessWidget {
  const ForeCastScreen({Key? key, required this.model}) : super(key: key);

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.weatherModel != null && cubit.forecastModel != null,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Forecast',
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Text(
                          DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff333739),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(
                              weatherImage(model.weather[0].id!),
                            ),
                            width: 75,
                            height: 75,
                          ),
                          // const SizedBox(
                          //   width: 15.0,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${model.name}',
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                    TextSpan(
                                      text: ' EG',
                                      //'  ${model.sys!.country}',
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '${model.weather[0].description}',
                                style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          // const Spacer(),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${model.main!.temp!.round()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                    fontSize: 60.0,
                                  ),
                                ),
                                TextSpan(
                                  text: '°',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                    fontSize: 60.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Next 7 Days',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                            return cardItemBuilder(context, cubit.forecastModel!.list[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20.0,
                        ),
                        itemCount: cubit.forecastModel!.list.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget cardItemBuilder(context, ListOfWeather model) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.d24}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${model.timed}',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${model.main!.temp}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 30.0,
                            ),
                      ),
                      TextSpan(
                        text: '°',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 40.0,
                              color: Colors.blue,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${model.weather[0].description}',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
             Image(
              image: AssetImage(
                weatherImage(
                  model.weather[0].id!,
                ),
              ),
              width: 60,
              height: 60,
            ),
          ],
        ),
      );
}
