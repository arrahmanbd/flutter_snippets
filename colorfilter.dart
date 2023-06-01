import 'package:flutter/material.dart';

class ColorFilterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
        height: 40,
      ),
      Center(
          child: ColorFiltered(
        child: Image.asset(
          "assets/flutter.png",
          scale: 5,
        ),
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      )),
      Container(
        height: 40,
      ),
      Center(
          child: ColorFiltered(
        child: Image.asset(
          "assets/flutter.png",
          scale: 5,
        ),
        colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
      )),
    ]));
  }
}
