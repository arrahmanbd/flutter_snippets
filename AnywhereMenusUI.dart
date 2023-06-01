import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_anywhere_menus/flutter_anywhere_menus.dart';

void main() {
  runApp(AnywhereMenusUI());
}

class AnywhereMenusUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Floating Menus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Floating Menus Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItem(child: Text('one')),
      MenuItem(child: Text('two')),
      MenuItem(child: Text('three')),
    ];

    final menuBar = MenuBar(menuItems: menuItems);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _counter.toString(),
            ),
            Material(
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  hoverColor: Colors.yellow,
                  onTap: () {},
                  child: Container(
                      constraints: BoxConstraints(maxHeight: 50),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Icon(Icons.access_alarms),
                          Icon(Icons.account_circle)
                        ],
                      )),
                )),
            Menu(
              child: MaterialButton(
                child: Text('Show Basic Menu'),
              ),
              menuBar: MenuBar(),
            ),
            Menu(
              child: MaterialButton(
                child: Text('Dem Fancy Menus'),
              ),
              menuBar: MenuBar(
                drawArrow: true,
                itemPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                menuItems: [
                  MenuItem(
                    child: Icon(Icons.color_lens, color: Colors.grey[600]),
                    onTap: () => _incrementCounter(),
                  ),
                  MenuItem(
                    child: Menu(
                      offset: Offset(0, 20),
                      child: Icon(Icons.colorize, color: Colors.grey[600]),
                      menuBar: MenuBar(
                          drawArrow: true,
                          drawDivider: true,
                          maxThickness: 68,
                          orientation: MenuOrientation.vertical,
                          menuItems: [MenuItem(child: Icon(Icons.add))]),
                    ),
                  ),
                  MenuItem(
                      child: Icon(Icons.content_copy, color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu TL'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.topLeft,
                    ),
                    Menu(
                      tapType: TapType.tap,
                      offset: Offset(0, 10),
                      child: MaterialButton(
                        child: Text('Show Menu T'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.topCenter,
                    ),
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu TR'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.topRight,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu CL'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.centerLeft,
                    ),
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu C'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.center,
                    ),
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu CR'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.centerRight,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu BL'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.bottomLeft,
                    ),
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu BC'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.bottomCenter,
                    ),
                    Menu(
                      tapType: TapType.tap,
                      child: MaterialButton(
                        child: Text('Show Menu BR'),
                      ),
                      menuBar: menuBar,
                      menuAlignmentOnChild: MenuAlignment.bottomRight,
                    ),
                  ],
                ),
                Menu(
                  tapType: TapType.tap,
                  child: Container(
                    width: 300,
                    height: 200,
                    color: Colors.yellow,
                    child: Center(child: Text('Show Menu Over Tap')),
                  ),
                  menuOverTap: true,
                  menuBar: menuBar,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
