import 'package:flutter/material.dart';

class TooltipWidget extends StatefulWidget {
  @override
  TooltipWidgetState createState() => TooltipWidgetState();
}

class TooltipWidgetState extends State<TooltipWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
        Container(),
        Container(
          margin: EdgeInsets.all(40),
          child: Tooltip(
              message: 'My Account',
              child: FlatButton(
                onPressed: () {  },
                child: Icon(
                  Icons.account_box,
                  size: 50,
                ),
              )),
        ),
        Container(),
        Text('Long press on the Icon!'),
      ])),
    );
  }
}
