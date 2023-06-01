import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:speedometer/speedometer.dart';
import 'package:rxdart/rxdart.dart';

void main(){
  runApp(SpeedometerUI());
}
class SpeedometerUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(title: 'my homepage',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _lowerValue = 20.0;
  double _upperValue = 40.0;
  int start = 0;
  int end = 100;

  int counter = 0;

  PublishSubject<double> eventObservable = new PublishSubject();
  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(seconds:1);
    var rng = new Random();
    new Timer.periodic(oneSec, (Timer t) => eventObservable.add(rng.nextInt(59)+rng.nextDouble()));

  }

  @override
  Widget build(BuildContext context) {
    final ThemeData somTheme = new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.black,
        backgroundColor: Colors.grey
    );
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text("SpeedoMeter"),
        ),
        body: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(40.0),
              child: new SpeedOMeter(start:start, end:end, highlightStart:(_lowerValue/end), highlightEnd:(_upperValue/end), themeData:somTheme, eventObservable: this.eventObservable),
            ),
          ],
        )
    );
  }


}