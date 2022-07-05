import 'package:flutter/material.dart';
import 'package:cimate/utilities/constants.dart';
import 'package:cimate/services/weather.dart';
import 'city_screen.dart';
import 'package:cimate/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final weatherdata;
  LocationScreen({this.weatherdata}) {}

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  double temp = 0;
  int temperature = 0;
  String city = 'rohtak';
  var weathericon = 'lol';
  var msg = 'lol';
  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getupdate(widget.weatherdata);
  }

  void getupdate(var weatherdata) {
    setState(() {
      temp = weatherdata['main']['temp'];
      temperature = temp.round();
      var condition = weatherdata['weather'][0]['id'];
      weathericon = weather.getWeatherIcon(condition);
      msg = weather.getMessage(temperature);
      city = weatherdata['name'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var tanu = await weather.thislocationweatherdata();
                      getupdate(tanu);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityname = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                      print(cityname);
                      if (cityname != null) {
                        print('got city');
                        var data = await weather.cityweatherdata(cityname);
                        getupdate(data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weathericon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg in $city ",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
