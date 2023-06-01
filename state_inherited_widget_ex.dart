import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatelessWidget {
  const InheritedWidgetExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _MyDemoApp(),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _MyDemoAppState myState;

  MyInheritedWidget({Key key, Widget child, @required this.myState})
      : super(key: key, child: child);

  @override
  // Returns when it's children widget should be notified for rebuild.
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

class _MyDemoApp extends StatefulWidget {
  @override
  _MyDemoAppState createState() => _MyDemoAppState();
}

class _MyDemoAppState extends State<_MyDemoApp> {
  // In this demo the state is just _counter.
  int _counter = 0;

  int get counterValue => _counter;

  // Note: these state-mutating functions must be wrapped by setState().
  void incrementCounter() => setState(() => _counter++);

  void decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("InheritedWidget allows efficient sharing of app's state down "
            "the widgets tree.\n\n"
            "In this example, the app's root widget is an InheritedWidget, "
            "so it's state is shared to the two `CounterAndButtons` widgets "
            "below. \n\n"
            "Clicking on child widget's button would update the root "
            "widget's counter.\n\n"
            "*Note*: Recommend using ScopedModel or BLoC for CHANGING parent's "
            "state from child widget.\n"),
        MyInheritedWidget(
          myState: this,
          child: _AppRootWidget(),
        ),
      ],
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(root widget)'),
          Text(
            '${rootWidgetsState.counterValue}',
            style: Theme.of(context).textTheme.display1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _CounterAndButton(),
              _CounterAndButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CounterAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Card(
      margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Text('(child widget)'),
          Text(
            '${rootWidgetsState.counterValue}',
            style: Theme.of(context).textTheme.display1,
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => rootWidgetsState.incrementCounter(),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => rootWidgetsState.decrementCounter(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
