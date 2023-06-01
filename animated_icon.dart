import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;

  Animation animation;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
        iconSize: 70,
        icon: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: controller,
        ),
        onPressed: () {
          setState(() {
            isPlaying = !isPlaying;
            isPlaying ? controller.forward() : controller.reverse();
          });
        },
      )),
    );
  }
}
