import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';

class CarouselExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Carousel(
            height: 350.0,
            width: 350,
            type: "slideswiper",
            indicatorType: "bubble",
            arrowColor: Colors.white,
            axis: Axis.horizontal,
            showArrow: true,
            children: List.generate(
                7,
                (i) => Center(
                      child: Container(color: Colors.red),
                    ))),
      ),
    );
  }
}
