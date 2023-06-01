import 'package:flutter/material.dart';

class MenuItem {
  String title;
  Widget screenname;
  Color color;
  String icon;
  String url;

  MenuItem(
      {@required this.title,
      this.screenname,
      @required this.color,
      @required this.icon,
      this.url});
}
