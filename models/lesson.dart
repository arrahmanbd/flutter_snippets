import 'package:flutter/material.dart';

class Lesson {
  String title;
  double indicatorValue;
  Widget child;
  String sourceFilePath;
  String description;
  Map<String, String> links;

  Lesson(
      {@required this.title,
      this.indicatorValue,
      @required this.child,
      @required this.sourceFilePath,
      this.description,
      this.links});
}
