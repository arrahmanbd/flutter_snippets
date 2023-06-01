import 'package:flutter/material.dart';

class ClipRRectWidget extends StatefulWidget {
  @override
  _ClipRRectWidgetState createState() => _ClipRRectWidgetState();
}

class _ClipRRectWidgetState extends State<ClipRRectWidget> {
  var _value = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 24, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.all(12),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        child: Container(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(_value),
                        clipBehavior: Clip.antiAlias,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
