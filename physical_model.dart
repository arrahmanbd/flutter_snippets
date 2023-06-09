import 'package:flutter/material.dart';

class Physicalmodel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 6.0,
      shape: BoxShape.rectangle,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Center(
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
