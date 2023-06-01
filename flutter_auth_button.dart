import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Flutter_Auth_Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const padding = 25.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: padding),
                AppleSignInButton(
                    onPressed: () {}, style: AppleButtonStyle.whiteOutline),
                AppleSignInButton(
                    onPressed: () {}, style: AppleButtonStyle.black),
                SizedBox(height: padding),
                GoogleSignInButton(onPressed: () {}, darkMode: true),
                SizedBox(height: padding),
                SizedBox(height: padding),
                SizedBox(height: padding),
                MicrosoftSignInButton(onPressed: () {}, darkMode: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;

  Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
