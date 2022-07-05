import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'package:bitcointicker/price_screen.dart';
import 'funtions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.lightBlue,
            scaffoldBackgroundColor: Colors.white),
        home: loading());
  }
}

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  var data;

  Future giverate() async {
    print('working');
    data = await funtions().getmevalue('BTC', 'USD');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(
        rate: data,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    giverate();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
