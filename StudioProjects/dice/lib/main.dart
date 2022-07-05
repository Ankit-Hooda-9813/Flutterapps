import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent[100],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blueGrey,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int v = 1;
  int r = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    v = Random().nextInt(6) + 1;
                    r = Random().nextInt(6) + 1;
                    print('hey user 1');
                  });
                },
                child: Image.asset("images/dice$v.png"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    r = Random().nextInt(6) + 1;
                    v = Random().nextInt(6) + 1;
                  });
                  print('Hey user2');
                },
                child: Image(
                  image: AssetImage(
                    "images/dice$r.png",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
