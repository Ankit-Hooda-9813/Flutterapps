import 'funtions.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String url1 = 'https://rest.coinapi.io/v1/exchangerate';
const apikey2 = '3B464D96-81FC-40E5-A06E-E0DB14D1D6D7';
const apikey = '35267C37-3BAF-458E-82E0-E70B8A5725DF';
// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=3B464D96-81FC-40E5-A06E-E0DB14D1D6D7

class PriceScreen extends StatefulWidget {
  var rate;
  PriceScreen({this.rate}) {}

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var rate;
  var rate1;
  var rate2;
  String current = 'USD';

  List<DropdownMenuItem<String>> listcurreny(List currencyList) {
    List<DropdownMenuItem<String>> list = [];
    for (String i in currencyList) {
      list.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    }
    return list;
  }

  Future update() async {
    print('first');
    rate = await funtion.getmevalue('BTC', current);
    rate1 = await funtion.getmevalue('ETH', current);
    rate2 = await funtion.getmevalue('LTC', current);
    print('second');
    print(rate);
    print('third');
    setState(() {
      rate;
    });
  }

  void updatefirst() {
    rate = widget.rate;
  }

  var funtion = funtions();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.rate);
    updatefirst();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $rate $current',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $rate1 $current',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $rate2 $current',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: current,
              onChanged: (value) {
                if (value != null) {
                  current = value;

                  update();
                }
              },
              items: listcurreny(currenciesList),
            ),
          ),
        ],
      ),
    );
  }
}
