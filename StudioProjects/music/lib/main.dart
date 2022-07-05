import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  void fun(int b) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("assets/note$b.wav"),
    );
  }

  Expanded funt({Color color = Colors.red, int soundno = 1}) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            fun(soundno);
          },
          child: Text('click here'),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hey User'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[500],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.redAccent,
                  child: TextButton(
                    onPressed: () {
                      fun(1);
                    },
                    child: Text('click here'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: TextButton(
                    onPressed: () {
                      fun(2);
                    },
                    child: Text('click here'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: TextButton(
                    onPressed: () {
                      fun(3);
                    },
                    child: Text('click here'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () {
                      fun(4);
                    },
                    child: Text('click here'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () {
                      fun(5);
                    },
                    child: Text('click here'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.indigo,
                  child: TextButton(
                    onPressed: () {
                      fun(6);
                    },
                    child: Text('click here'),
                  ),
                ),
              ),
              funt(color: Colors.purple, soundno: 7),
            ],
          ),
        ),
      ),
    );
  }
}
