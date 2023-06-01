import 'package:flutter/material.dart';
import "package:flutter_custom_credit_card_ui/flutter_custom_credit_card_ui.dart";

void main() {
  runApp(CustomCreditCardUI());
}

class CustomCreditCardUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Preview Screen'),
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
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CustomCreditCard(
                cardNumber: "5500000000000004",
                cardHolder: "Paul Walker",
                year: _dateTime.year,
                month: _dateTime.month,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: CustomCreditCard(
                cardNumber: "3411111111111111",
                cardHolder: "Paul Walker",
                year: _dateTime.year,
                month: _dateTime.month,
              ),
            )
          ],
        ),
      ),
    );
  }
}