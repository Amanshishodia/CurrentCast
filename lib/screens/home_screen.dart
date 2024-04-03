import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:weatherapp_starter_project/controller/globar_controller.dart";
import "package:weatherapp_starter_project/utils/custom_colors.dart";
import "package:weatherapp_starter_project/widgets/comfort_level.dart";

import "package:weatherapp_starter_project/widgets/current_Weather_widget.dart";
import "package:weatherapp_starter_project/widgets/daily_data_forecast.dart";
import "package:weatherapp_starter_project/widgets/header_widget.dart";
import "package:weatherapp_starter_project/widgets/hourly_data_widget.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),

                  // for our current Temprature ('current')
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather()),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ComfortLevel(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather())
                ],
              ))),
      ),
    );
  }
}
