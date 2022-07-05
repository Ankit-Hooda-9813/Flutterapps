import 'package:cimate/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cimate/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cimate/services/weather.dart';

const apikey = 'e040a16a32437a7e4d5bd4ef55668aee';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //givelocation();
    getweatherdata();
  }

  void getweatherdata() async {
    print('working');

    WeatherModel weatherModel = WeatherModel();
    var data = await weatherModel.thislocationweatherdata();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherdata: data,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
