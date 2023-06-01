import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Fluttering Life.',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.lightGreenAccent,
            fontSize: 32.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
