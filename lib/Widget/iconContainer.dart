import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/Controller/GlobalController.dart';

class iconContainer extends StatelessWidget {
  iconContainer({super.key});

  GlobalController controller = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    DateTime sunRisedateTime = DateTime.fromMillisecondsSinceEpoch(
        controller.currentWeather[0].sys.sunrise! * 1000);
    DateTime sunSetdateTime = DateTime.fromMillisecondsSinceEpoch(
        controller.currentWeather[0].sys.sunset! * 1000);
    String formattedTimeSunRise = DateFormat('jm').format(sunRisedateTime);
    String formattedTimeSunSet = DateFormat('jm').format(sunSetdateTime);
    return Wrap(
      runSpacing: 10,
      spacing: 8,
      children: [
        Container(
            height: 140,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.blue.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/icons/clouds.png",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text("Clouds",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45)),
                const SizedBox(
                  height: 3,
                ),
                Text("${controller.currentWeather[0].clouds.all.toString()}%",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45)),
              ],
            )),
        Container(
            height: 140,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.blue.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/icons/windspeed.png",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text("winds",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45)),
                const SizedBox(
                  height: 3,
                ),
                Text(
                    "${controller.currentWeather[0].wind.speed.toString()} km/h",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45)),
              ],
            )),
        Container(
            height: 140,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.blue.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/icons/humidity.png",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text("humidity",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45)),
                const SizedBox(
                  height: 3,
                ),
                Text(
                    "${controller.currentWeather[0].main.humidity.toString()}%",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45)),
              ],
            )),
        Container(
            height: 140,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.blue.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/icons/sun.png",
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text("Sun Rise",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45)),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(formattedTimeSunRise.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Sun Set",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45)),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(formattedTimeSunSet.toString(),
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45)),
                      ],
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
