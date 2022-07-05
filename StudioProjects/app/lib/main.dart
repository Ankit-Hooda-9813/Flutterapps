import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hey owner'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey[100],
        body: Center(
          child: Image(
            image: AssetImage('assets/images.jpeg'),
          ),
        ),
      ),
    ),
  );
}
