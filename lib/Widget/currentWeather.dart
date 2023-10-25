import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/Controller/GlobalController.dart';
import 'package:weatherapp_starter_project/Widget/iconContainer.dart';


class currentWeatherWidget extends StatefulWidget {
  const currentWeatherWidget({super.key});

  @override
  State<currentWeatherWidget> createState() => _currentWeatherWidgetState();
}

class _currentWeatherWidgetState extends State<currentWeatherWidget> {

  GlobalController controller= Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Obx(() {
            int timestamp = controller.currentWeather[0].dt; // Your Unix timestamp
            DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

            // Format the date and time
            String formattedTime = DateFormat('E, h:mm a').format(dateTime);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${controller.currentWeather[0].main.temp.toString()}°",style: const TextStyle(fontSize: 70),),
                // const SizedBox(height: 5,),
                Text(controller.currentWeather[0].weather[0].main,style: const TextStyle(fontSize: 18),),
                const SizedBox(height: 30,),
                Text(controller.currentWeather[0].name,style: const TextStyle(fontSize: 18),),
                Text(
                  "max ${controller.currentWeather[0].main.tempMax.toString()}° / min ${controller.currentWeather[0].main.tempMin.toString()}° Feels like ${controller.currentWeather[0].main.feelsLike.toString()}°",style: const TextStyle(fontSize: 15,height: 1.2),),
                 Text(formattedTime,style: const TextStyle(fontSize: 15,height: 1.5),),
                const SizedBox(height: 30,),

              ],
            );
          }),
          Positioned(
            left: 0,
            right: 20,
            top: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/weather/${controller.currentWeather[0].weather[0].icon}.png"),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
//Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//
//         Image.asset('assets/weather/${controller.currentWeather[0].weather[0].icon}.png'),
//         Obx(() {
//           return RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: "${controller.currentWeather[0].main.temp.toString()}°",
//                   style: const TextStyle(fontSize: 50, color: Colors.black),
//                 ),
//                 TextSpan(
//                   text: controller.currentWeather[0].weather[0].main,
//                   style: const TextStyle(fontSize: 20, color: Colors.grey),
//                 ),
//               ],
//             ),
//           );
//         }),
//
//       ],
//     );