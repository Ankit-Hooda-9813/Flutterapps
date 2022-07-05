import 'package:geolocator/geolocator.dart';

class loading {
  double latitude = 0, longitude = 0;
  Future<void> getlocation() async {
    try {
      //LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      print('lol');
      print(e);
    }
  }
}
