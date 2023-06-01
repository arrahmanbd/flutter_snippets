import 'package:flutter/material.dart';
import 'package:decorative_app_bar/decorative_app_bar.dart';

void main() {
  return runApp(DecorativeAppBarUI());
}

class DecorativeAppBarUI extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<DecorativeAppBarUI> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.white, Color(0xffffccbc)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget text() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(top: 50, left: 20),
          child: Text("Hey There,",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 40,
              )),
        ),
        Padding(
            padding: EdgeInsets.only(top: 45, right: 20),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
              size: 40.0,
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        body: DecorativeAppBar(
          barHeight: 400,
          barPad: 170,
          radii: 100,
          background: Colors.pink[50],
          gradient1: Colors.white,
          gradient2: Colors.green,
          extra: text(),
        ));
  }
}
