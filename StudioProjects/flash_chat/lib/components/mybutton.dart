import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  Color color;
  void Function() onpressed = () {};
  String text;
  mybutton(
      {required this.onpressed,
      this.color = Colors.lightBlueAccent,
      this.text = 'Click here'}) {}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:
              //Go to login screen.
              /*Navigator.pushNamed(context, LoginScreen.id)*/
              onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
