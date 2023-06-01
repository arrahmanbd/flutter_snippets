import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DraggablePage>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Draggable(
          child: Icon(
            Icons.flight_takeoff,
            size: 90.0,
          ),
          feedback: Icon(
            Icons.flight_takeoff,
            size: 90.0,
          ),
          childWhenDragging: Icon(
            Icons.flight_land,
            size: 90.0,
          ),
        ),
      ),
    );
  }
}
