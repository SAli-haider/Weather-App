import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/Controller/GlobalController.dart';

class AdditionalInfo extends StatelessWidget {
  AdditionalInfo({super.key});

  GlobalController controller = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.blue.shade200)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            const Text(
              "Summary",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              controller.dailyWeather[0].daily[0].summary.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            ),
          ]),
        ),
      );
    });
  }
}
