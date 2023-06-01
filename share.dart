import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

const googleIcon = 'assets/google.png';
const dartIcon = 'assets/dart.png';
const flutterIcon = 'assets/flutter.png';

class AdvancedScreen extends StatefulWidget {
  @override
  _AdvancedScreenState createState() => _AdvancedScreenState();
}

class _AdvancedScreenState extends State<AdvancedScreen>
    with SingleTickerProviderStateMixin {
  double validScratches = 0;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..addStatusListener(
        (listener) {
          if (listener == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
      );
    _animation = Tween(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Scratcher',
                  style: TextStyle(
                    fontFamily: 'The unseen',
                    color: Colors.blueAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Scratch to Win :)',
                  style: TextStyle(
                    fontFamily: 'The unseen',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 1,
                  width: 300,
                  color: Colors.black12,
                )
              ],
            ),
            buildRow(googleIcon, flutterIcon, googleIcon),
            buildRow(
              dartIcon,
              flutterIcon,
              googleIcon,
            ),
            buildRow(dartIcon, flutterIcon, dartIcon),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String left, String center, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScratchBox(image: left),
        ScratchBox(
          image: center,
          animation: _animation,
          onScratch: () {
            setState(() {
              validScratches++;
              if (validScratches == 3) {
                _animationController.forward();
              }
            });
          },
        ),
        ScratchBox(image: right),
      ],
    );
  }
}

class BasicScreen extends StatefulWidget {
  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  double progress = 0;
  bool thresholdReached = false;
  final key = GlobalKey<ScratcherState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scratcher(
          key: key,
          brushSize: 30,
          threshold: 30,
          color: Colors.red,
          onThreshold: () => setState(() => thresholdReached = true),
          onChange: (value) {
            setState(() {
              progress = value;
            });
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Scratch the screen to win',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.amber),
                  ),
                ],
              ),
            ),
            color: Colors.grey,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: RaisedButton(
            child: const Text('Reset'),
            onPressed: () {
              key.currentState.reset(
                duration: const Duration(milliseconds: 2000),
              );
              setState(() => thresholdReached = false);
            },
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: RaisedButton(
            child: const Text('Reveal'),
            onPressed: () {
              key.currentState.reveal(
                duration: const Duration(milliseconds: 2000),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Text(
            '${progress.round().toString()}%',
          ),
        ),
        Positioned(
          bottom: 30,
          right: 10,
          child: Text(
            'Threshold reached: $thresholdReached',
          ),
        )
      ],
    );
  }
}

class ScratcherExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.blueGrey,
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.looks_one)),
              Tab(icon: Icon(Icons.looks_two)),
            ],
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              AdvancedScreen(),
              BasicScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScratchBox extends StatefulWidget {
  ScratchBox({
    this.image,
    this.onScratch,
    this.animation,
  });

  final String image;
  final VoidCallback onScratch;
  final Animation<double> animation;

  @override
  _ScratchBoxState createState() => _ScratchBoxState();
}

class _ScratchBoxState extends State<ScratchBox> {
  bool isScratched = false;
  double opacity = 0.5;

  @override
  Widget build(BuildContext context) {
    var icon = AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 750),
      child: Image.asset(
        widget.image,
        width: 70,
        height: 70,
        fit: BoxFit.contain,
      ),
    );

    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.all(10),
      child: Scratcher(
        accuracy: ScratchAccuracy.low,
        color: Colors.blueGrey,
        image: Image.asset('assets/scratch.png'),
        brushSize: 15,
        threshold: 60,
        onThreshold: () {
          setState(() {
            opacity = 1;
            isScratched = true;
          });
          widget.onScratch?.call();
        },
        child: Container(
          child: widget.animation == null
              ? icon
              : ScaleTransition(
                  scale: widget.animation,
                  child: icon,
                ),
        ),
      ),
    );
  }
}
