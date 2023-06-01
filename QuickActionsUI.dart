import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(QuickActionsUI());
}

class QuickActionsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quick Actions Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String shortcut = "no action set";

  @override
  void initState() {
    super.initState();
    final QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      setState(() {
        if (shortcutType != null) shortcut = shortcutType;
      });
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'Notification',
        localizedTitle: 'Notifications',
        icon: 'notification',
      ),

      const ShortcutItem(
          type: 'Share',
          localizedTitle: 'Share',
          icon: 'share'),

      const ShortcutItem(
          type: 'Message',
          localizedTitle: 'Message',
          icon: 'message'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$shortcut'),
      ),
      body:  Padding(
        padding: EdgeInsets.all(25.0),
        child: Text('On home screen, long press the app icon to '
            'get Quick Action options. Tapping on that action should '
            'set the toolbar title.'),
      ),
    );
  }
}