import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/Model/currentWeather_Model.dart';
import 'package:weatherapp_starter_project/Model/daily_model.dart';
import 'package:weatherapp_starter_project/Model/hourl_model.dart';
import '../Api/Api.dart';

class GlobalController extends GetxController {
  //Create variable
  final RxBool _isLoading = true.obs;

  var currentWeather = <CurrentWeather>[].obs;
  var hourlyWeather = <HourlyWeather>[].obs;
  var dailyWeather = <DailyWeather>[].obs;

  Api repo = Api();

  //create instance for them to be called

  RxBool checkLoading() => _isLoading;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
      print("onInit called");
    }
    super.onInit();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

// Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('', 'Location Permission Denied');

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    print(position.latitude);
    print(position.longitude);
    if (position.latitude != null && position.longitude != null) {
      repo
          .currentWeatherApi(
              position.latitude.toString(), position.longitude.toString())
          .then((value) {
        currentWeather.add(value);
      });
      repo
          .hourlyWeatherApi(
              position.latitude.toString(), position.longitude.toString())
          .then((value) {
        hourlyWeather.add(value);
      });
      repo
          .dailyWeatherApi(
              position.latitude.toString(), position.longitude.toString())
          .then((value) {
        dailyWeather.add(value);
        _isLoading.value = false;
      });
    } else {
      Get.snackbar("title", "Please Check Permission");
    }
  }
}
