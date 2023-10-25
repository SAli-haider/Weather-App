import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/Controller/GlobalController.dart';

class HourlyWeatherWidget extends StatelessWidget {
  HourlyWeatherWidget({super.key});

  GlobalController controller = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    // Format the date and time
    // String formattedTime = DateFormat('h:mm a').format(dateTime);

    return SizedBox(
        width: double.infinity,
        height: 200,
        child: Obx(() {
          final hourlyWeather = controller.hourlyWeather;
          final weatherList =
              hourlyWeather.isNotEmpty ? hourlyWeather[0].list : [];

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherList.length > 12 ? 12 : weatherList.length,
            itemBuilder: (context, index) {
              if (index < weatherList.length) {
                final weatherData = weatherList[index];
                final weatherIcon = weatherData.weather[0].icon;
                final weatherTime = weatherData.dt;
                final weatherTemp = weatherData.main.temp;
                final time = DateFormat('jm').format(
                    DateTime.fromMillisecondsSinceEpoch(weatherTime * 1000));

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(time.toString(),
                            style: const TextStyle(fontSize: 16)),
                        Image.asset("assets/weather/$weatherIcon.png"),
                        Text("${weatherTemp.toString()}°",
                            style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                );
              } else {
                Container();
              }
            },
          );
        }));
  }
}
