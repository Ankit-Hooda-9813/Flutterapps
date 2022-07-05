import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);
int height = 120;
int weight = 20;
int age = 1;

enum gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Color femalecolor = inactivecolor;
  Color malecolor = inactivecolor;

  void updatecolor(gender a) {
    if (a == gender.male) {
      malecolor = activecolor;
      femalecolor = inactivecolor;
    }
    if (a == gender.female) {
      malecolor = inactivecolor;
      femalecolor = activecolor;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF090C22),
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(gender.male);
                      });
                    },
                    child: Mycontainer(
                      colour: malecolor,
                      cardchild: mycolumn(
                        textcolor: Color(0xFF8D8E98),
                        text: 'MALE',
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(gender.female);
                      });
                    },
                    child: Mycontainer(
                      colour: femalecolor,
                      cardchild: mycolumn(
                        textcolor: Color(0xFF8D8E98),
                        icone: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Mycontainer(
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          '$height',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 50,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.white70,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        })
                  ],
                ),
                colour: Color(0xFF1D1E33),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Mycontainer(
                      colour: Color(0xFF1D1E33),
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 50,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mybutton(
                                onPressed: () {
                                  setState(() {
                                    weight = (weight + 1) % 150;
                                  });
                                },
                                data: FontAwesomeIcons.plus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              mybutton(
                                onPressed: () {
                                  setState(() {
                                    (weight != 0) ? weight-- : weight = 0;
                                  });
                                },
                                data: FontAwesomeIcons.minus,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Mycontainer(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 50,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            mybutton(
                              onPressed: () {
                                setState(() {
                                  age = (age + 1) % 100;
                                });
                              },
                              data: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            mybutton(
                              onPressed: () {
                                setState(() {
                                  (age != 0) ? age-- : age = 0;
                                });
                              },
                              data: FontAwesomeIcons.minus,
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Container(
                //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                color: Colors.pink,
                height: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class mycolumn extends StatelessWidget {
  IconData icone;
  double gap;
  String text;
  Color textcolor;
  double textsize;

  mycolumn(
      {required this.textcolor,
      this.gap = 15,
      this.icone = FontAwesomeIcons.mars,
      this.text = 'text',
      this.textsize = 18}) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          color: Colors.white70, //<-- SEE HERE
          icone,
          size: 80,
        ),
        SizedBox(
          height: gap,
        ),
        Text(
          text,
          style: TextStyle(color: textcolor, fontSize: textsize),
        )
      ],
    );
  }
}

class Mycontainer extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  Mycontainer({this.colour = Colors.white70, required this.cardchild}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class mybutton extends StatelessWidget {
  IconData data = FontAwesomeIcons.plus;
  final VoidCallback onPressed;
  mybutton({this.data = FontAwesomeIcons.plus, required this.onPressed}) {}
  int funt(int a, IconData data) {
    (data == FontAwesomeIcons) ? a++ : a--;
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        data,
        color: Colors.white70,
      ),
      constraints: BoxConstraints.tightFor(width: 56, height: 66),
    );
  }
}
