import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class CustomPainterPractice extends StatefulWidget {
  @override
  _CustomPainterPracticeState createState() => _CustomPainterPracticeState();
}

class _CustomPainterPracticeState extends State<CustomPainterPractice>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  double drawTime = 0.0;
  double drawDuration = 4.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(seconds: drawDuration.toInt()));
    animation =
        Tween<double>(begin: 0.001, end: drawDuration).animate(controller)
          ..addListener(() {
            setState(() {
              drawTime = animation.value;
            });
          });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 18, color: Colors.white);
    const double padding = 40.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: CustomPaint(
          painter: BobRoss(drawTime, drawDuration),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: padding),
                child: Text(
                  "Curves.bounceInOut",
                  style: textStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: padding),
                child: Text(
                  "Curves.easeInOutCubic",
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BobRoss extends CustomPainter {
  final double drawTime;
  final double drawDuration;

  BobRoss(this.drawTime, this.drawDuration);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.greenAccent;
    canvas.drawRect(
      Rect.fromLTWH(
          0.0,
          0.0,
          size.width *
              Curves.bounceInOut.transformInternal(drawTime / drawDuration),
          50),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
          0.0,
          60.0,
          size.width *
              Curves.easeInOutCubic.transformInternal(drawTime / drawDuration),
          50),
      paint,
    );
  }

  @override
  bool shouldRepaint(BobRoss oldDelegate) => true;
}
