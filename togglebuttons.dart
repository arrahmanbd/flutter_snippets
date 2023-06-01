import 'package:flutter/material.dart';

class DemoTogglebutton extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DemoTogglebutton> {
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter - tutorialkart.com')),
      ),
      body: ListView(children: <Widget>[
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: ToggleButtons(
              children: <Widget>[
                Icon(Icons.add_comment),
                Icon(Icons.airline_seat_individual_suite),
                Icon(Icons.add_location),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  _selections[index] = !_selections[index];
                });
              },
            ))
      ]),
    ));
  }
}
