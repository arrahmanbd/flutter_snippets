import 'package:flutter/material.dart';
import 'package:radial_menu/radial_menu.dart';

void main() {
  runApp(RadialMenuUI());
}

const _title = 'Radial Menu Demo';

class RadialMenuUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RadialMenuEntry> radialMenuEntries = [
    RadialMenuEntry(
        icon: Icons.restaurant, text: 'Restaurant', color: Colors.red),
    RadialMenuEntry(
        icon: Icons.hotel,
        text: 'Hotel',
        iconColor: Colors.lightBlue,
        textColor: Colors.amber),
    RadialMenuEntry(icon: Icons.pool, text: 'Pool', iconSize: 36),
    RadialMenuEntry(icon: Icons.shopping_cart, text: 'Shop'),
  ];

  @override
  Widget build(BuildContext context) {
    double size = 220;
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "   Where would you go next?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(height: 10),
              Text("    Click that button to choose now"),
              Container(height: 40),
              Transform.translate(
                  offset: Offset(-size / 2 + 40, 0),
                  child: RadialMenu(
                    size: size,
                    entrySize: 120,
                    entries: radialMenuEntries,
                  ))
            ]));
  }
}
