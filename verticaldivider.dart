import 'package:flutter/material.dart';

class Verticaldivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(child: Text('Item1')),
        VerticalDivider(),
        Container(
          child: Text('Item2'),
        ),
        VerticalDivider(),
        Container(
          child: Text('Item3'),
        ),
      ],
    ));
  }
}
