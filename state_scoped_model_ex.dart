import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelExample extends StatelessWidget {
  const ScopedModelExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _MyDemoApp(),
    );
  }
}

class _MyState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void incrementCounter() {
    _counter++;

    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

class _MyDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(
            "ScopedModel allows efficient sharing/updating of app's state from "
            "children widgets down the widgets tree.\n\n"
            "In this example, the app's root widget is a ScopedModel, "
            "so it's state is shared to the two 'CounterAndButtons' children"
            " widgets below. \n\n"
            "Clicking on child widget's button would update the MyStateModel "
            "of root widget.\n"),
        ScopedModel<_MyState>(
          model: _MyState(),
          child: _AppRootWidget(),
        ),
      ],
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(root widget)'),
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
    return ScopedModelDescendant<_MyState>(
      rebuildOnChange: true,
      builder: (context, child, model) => Card(
        margin: EdgeInsets.all(4.0).copyWith(top: 32.0, bottom: 32.0),
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Text('(child widget)'),
            Text(
              '${model.counterValue}',
              style: Theme.of(context).textTheme.display1,
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => model.incrementCounter(),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => model.decrementCounter(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
