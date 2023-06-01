import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';

void main() => runApp(BeforeAndAfterImage());

class BeforeAndAfterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Before After'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: BeforeAfter(
                beforeImage: Image.asset('assets/images/after.png'),
                afterImage: Image.asset('assets/images/before.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: BeforeAfter(
                beforeImage: Image.asset('assets/images/after.png'),
                afterImage: Image.asset('assets/images/before.png'),
                isVertical: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}