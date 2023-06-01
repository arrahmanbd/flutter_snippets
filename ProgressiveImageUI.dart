import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(ProgressiveImageUI());

class ProgressiveImageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Progressive Image Examples')),
        body: ProgressiveImageExample(),
      ),
    );
  }
}

class ProgressiveImageExample extends StatelessWidget {
  final Widget example1 = ProgressiveImage(
    placeholder: AssetImage('assets/images/placeholder.jpg'),
    thumbnail: NetworkImage('https://i.imgur.com/eOQL4jg.jpg'),
    image: NetworkImage('https://i.imgur.com/mDQ3Qbi.jpg'),
    height: 300,
    width: 500,
    fit: BoxFit.cover,
  );

  final Widget example2 = ProgressiveImage.assetNetwork(
    placeholder: 'assets/images/placeholder.gif',
    thumbnail: 'https://i.imgur.com/7XL923M.jpg',
    image: 'https://i.imgur.com/xVS07vQ.jpg',
    height: 250,
    width: 500,
    fit: BoxFit.cover,
  );

  final Widget example3 = ProgressiveImage.memoryNetwork(
    placeholder: kTransparentImage,
    thumbnail: 'https://i.imgur.com/vz6P3pD.jpg',
    image: 'https://i.imgur.com/GL54OhH.jpg',
    height: 250,
    width: 500,
  );

  Widget _text(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _text('Example 1'),
            example1,
            _text('Example 2'),
            example2,
            _text('Example 3'),
            example3,
            _text('End'),
          ],
        ),
      ),
    );
  }
}