import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/Controller/GlobalController.dart';
import 'package:weatherapp_starter_project/Widget/additionalInfo.dart';
import 'package:weatherapp_starter_project/Widget/currentWeather.dart';
import 'package:weatherapp_starter_project/Widget/dailyWeather.dart';
import 'package:weatherapp_starter_project/Widget/hourlyWeatherWidget.dart';
import 'package:weatherapp_starter_project/Widget/iconContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController controller =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => controller.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      // Header(),
                      const SizedBox(
                        height: 20,
                      ),
                      const currentWeatherWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      HourlyWeatherWidget(),
                      const SizedBox(
                        height: 15,
                      ),
                      AdditionalInfo(),
                      const SizedBox(
                        height: 15,
                      ),
                      DailyWeather(),
                      const SizedBox(
                        height: 10,
                      ),
                      iconContainer(),
                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ))),
    );
  }
}
