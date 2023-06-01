import 'package:flutter/material.dart';

class Aspectratio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: new AspectRatio(
        aspectRatio: 4 / 3,
        child: new Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
