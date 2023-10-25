import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/Controller/GlobalController.dart';

class DailyWeather extends StatelessWidget {
  DailyWeather({super.key});

  GlobalController controller = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.blue[50]!, // Blue[200] is a shade of blue
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: const Offset(0, 2), // Offset (x, y)
          ),
        ],
        border: Border.all(
          color: Colors.blue[200]!,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(() {
        final dailyWeather = controller.dailyWeather;
        final weatherList =
            dailyWeather.isNotEmpty ? dailyWeather[0].daily : [];
        final itemCount = weatherList.length > 8 ? 8 : weatherList.length;

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index < weatherList.length) {
              final dailyData = weatherList[index];
              final isToday = index == 0;
              final date = isToday
                  ? 'Today'
                  : DateFormat('E').format(
                      DateTime.fromMillisecondsSinceEpoch(dailyData.dt * 1000));
              final weatherIcon =
                  "assets/weather/${dailyData.weather[0].icon}.png";
              final minMax =
                  "${dailyData.temp.min.toString()}° / ${dailyData.temp.max.toString()}°";

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 70,
                        child: Text(date,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black87,
                                fontWeight: FontWeight.w300))),
                    const SizedBox(width: 40),
                    Image.asset(weatherIcon, height: 20, width: 20),
                    const SizedBox(width: 40),
                    Text(minMax),
                  ],
                ),
              );
            } else {
              return Container(); // Return an empty container when index is out of range
            }
          },
        );
      }),
    );
  }
}
