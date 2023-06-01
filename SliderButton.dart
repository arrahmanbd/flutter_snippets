import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:slider_button/slider_button.dart';

void main() => runApp(SliderButtonUI());

class SliderButtonUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SliderButton(
          action: () {
            Navigator.of(context).pop();
          },
          label: Text(
            "Slide to Cancel Event",
            style: TextStyle(
                color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                textAlign: TextAlign.right,
          ),
          icon: Text(
            "x",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 44,
            ),
          ),


        )));
  }
}
