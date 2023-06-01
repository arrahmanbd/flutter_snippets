import 'package:flutter/material.dart';

class Animated_Padding extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Animated_Padding> {
  double padValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: AnimatedPadding(
              child: Container(
                color: Colors.red,
              ),
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(padValue),
              curve: Curves.easeInOut,
            ),
          ),
          Text('Padding Value: $padValue'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Add Padding'),
                onPressed: () {
                  setState(() {
                    padValue = padValue + 10;
                  });
                },
              ),
              RaisedButton(
                child: Text('Sub Padding'),
                onPressed: () {
                  setState(() {
                    if (padValue != 0) {
                      padValue = padValue - 10;
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
