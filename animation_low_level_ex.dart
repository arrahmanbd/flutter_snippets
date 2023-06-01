import 'package:flutter/material.dart';

class LowLevelAnimationExample extends StatefulWidget {
  const LowLevelAnimationExample({Key key}) : super(key: key);

  @override
  _LowLevelAnimationExampleState createState() =>
      _LowLevelAnimationExampleState();
}

class _LowLevelAnimationExampleState extends State<LowLevelAnimationExample>
    with SingleTickerProviderStateMixin {
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;

  AnimationController _controller;

  // A CurvedAnimation defines progression as a non-linear curve.
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    this._curve =
        CurvedAnimation(parent: this._controller, curve: Curves.easeIn);
    // A Tween interpolates between the range of data.
    this._sizeAnimation =
        Tween<double>(begin: 50, end: 100).animate(this._curve);
    this._colorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.red)
            .animate(this._curve);
    // With addListener(), a listener function is called whenever the value of
    // the animation changes, e.g. call setState() to cause a rebuild.
    this._controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose controller to release resources.
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8.0),
          child: FlutterLogo(),
          color: this._colorAnimation.value,
          height: this._sizeAnimation.value,
          width: this._sizeAnimation.value,
        ),
        RaisedButton(
          child: Text('Forward animation'),
          onPressed:
              this._controller.isCompleted ? null : () => _controller.forward(),
        ),
        RaisedButton(
          child: Text('Reverse animation'),
          onPressed:
              this._controller.isDismissed ? null : () => _controller.reverse(),
        ),
        RaisedButton(
          child: Text('Loop animation'),
          onPressed: () {
            // Use addStatusListener() for notifications of changes to the
            // animation’s state, such as starting, stopping, or reversing
            // direction.
            this._controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                this._controller.reverse();
              } else if (status == AnimationStatus.dismissed) {
                this._controller.forward();
              }
            });
            this._controller.forward();
          },
        ),
      ],
    );
  }
}
