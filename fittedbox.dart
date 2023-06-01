import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FittedBox(
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.network(
                      "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
                Container(
                  child: Text(
                      "This is a widget to understand how the fittedbox works"),
                )
              ],
            ),
            alignment: Alignment.centerLeft,
          )
        ],
      ),
    );
  }
}
