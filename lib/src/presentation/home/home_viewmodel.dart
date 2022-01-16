import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/model/weahter_model.dart';
import 'package:flutter_app/src/resource/repo/weather_repositoru.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewModel extends BaseViewModel {
  static WeatherRepository weatherRepository = WeatherRepository();
  WeatherModel? weatherModel;

  init() async {
    await _determinePosition().then((value) async {
      await _getWeatherCurrent(value);
    });
  }

  _getWeatherCurrent(Position position) async {
    print("ok");
    Position position = await Geolocator.getCurrentPosition();
    weatherModel = await weatherRepository.getWeatherByLocation(
        position.latitude.toString(), position.longitude.toString());
    print("tran cao thien: ${weatherModel?.currently?.temperature}");
    notifyListeners();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
