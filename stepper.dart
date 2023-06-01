import "package:flutter/material.dart";

class StepperPage extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperPage> {
  var _index = 0;

  Widget _simpleStep() => Container(
        color: Colors.green,
        child: Stepper(
          steps: [
            Step(
              title: Text("Start"),
              content: Text("Before starting, we should create a page."),
            ),
            Step(
              title: Text("Constructor"),
              content: Text("Let's look at its construtor."),
            ),
          ],
        ),
      );

  Widget _steps() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red,
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              subtitle: Text("This is our first article"),
              content: Text(
                  "In this article, I will tell you how to create a page."),
            ),
            Step(
                title: Text("Second"),
                subtitle: Text("Constructor"),
                content: Text("Let's look at its construtor."),
                state: StepState.editing,
                isActive: true),
            Step(
                title: Text("Third"),
                subtitle: Text("Constructor"),
                content: Text("Let's look at its construtor."),
                state: StepState.error),
          ],
        ),
      );

  Widget _typeStep() => Container(
        margin: EdgeInsets.only(top: 10),
        constraints: BoxConstraints.expand(height: 200),
        color: Colors.green,
        child: Stepper(
          type: StepperType.horizontal,
          steps: [
            Step(
              title: Text("First"),
              content: Text("This is our first example."),
            ),
            Step(
              title: Text("Second"),
              content: Text("This is our second example."),
            ),
          ],
        ),
      );

  Widget _tabStep() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.blue,
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              content: Text("This is our first example."),
            ),
            Step(
              title: Text("Second"),
              content: Text("This is our second example."),
            ),
            Step(
              title: Text("Third"),
              content: Text("This is our third example."),
            ),
            Step(
              title: Text("Forth"),
              content: Text("This is our forth example."),
            ),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          onStepCancel: () {
            print("You are clicking the cancel button.");
          },
          onStepContinue: () {
            print("You are clicking the continue button.");
          },
        ),
      );

  Widget _builderStep() => Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red,
        child: Stepper(
          steps: [
            Step(
              title: Text("First"),
              content: Text("This is our first example."),
            ),
            Step(
              title: Text("Second"),
              content: Text("This is our second example."),
            ),
            Step(
              title: Text("Third"),
              content: Text("This is our third example."),
            ),
            Step(
              title: Text("Forth"),
              content: Text("This is our forth example."),
            ),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
              Container(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _simpleStep(),
          _steps(),
          _typeStep(),
          _tabStep(),
          _builderStep(),
          SizedBox(height: 600)
        ],
      ),
    ));
  }
}
