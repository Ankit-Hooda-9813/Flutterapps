import 'networking.dart';

import 'package:cimate/services/location.dart';

class WeatherModel {
  Future cityweatherdata(String city) async {
    giveweatherdata dataobject = giveweatherdata(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e040a16a32437a7e4d5bd4ef55668aee&units=metric');
    dynamic data = await dataobject.givedata();
    return data;
  }

  Future thislocationweatherdata() async {
    /*    loading load = loading();
    await load.getlocation();
    double latitude = load.latitude;
    double longitude = load.longitude;*/
    giveweatherdata dataobject = giveweatherdata(
        'https://api.openweathermap.org/data/2.5/weather?lat=76.6022652533935&lon=28.954954954954953&appid=e040a16a32437a7e4d5bd4ef55668aee&units=metric');
    dynamic data = await dataobject.givedata();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
