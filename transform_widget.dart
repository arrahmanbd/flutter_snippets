import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.0,
      origin: Offset(50.0, 50.0),
      child: Container(
        height: 50.0,
        width: 50.0,
        color: Colors.green,
      ),
    );
  }
}
