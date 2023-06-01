import "package:flutter/material.dart";

class SnackPage extends StatefulWidget {
  @override
  _SnackState createState() => _SnackState();
}

class _SnackState extends State<SnackPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  Widget _snackAction() => SnackBar(
        content: Text(
          "Test the action in the SnackBar.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
          label: "I Know!",
          textColor: Colors.white,
          disabledTextColor: Colors.black,
          onPressed: () {
            print("I know you are testing the action in the SnackBar!");
          },
        ),
        backgroundColor: Colors.lightBlue,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: Center(
          child: RaisedButton(
            onPressed: () {
              final bar = _snackAction();
              _key.currentState.showSnackBar(bar);
            },
            child: Text("Show the snack bar"),
            color: Colors.red,
          ),
        ));
  }
}
