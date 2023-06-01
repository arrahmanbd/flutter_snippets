import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

void main() {
  runApp(SpinCircleBottomBarUI());
}

class SpinCircleBottomBarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home:MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SpinCircle Example"),
        ),
        body: SpinCircleBottomBarHolder(
            bottomNavigationBar: SCBottomBarDetails(
                circleColors: [Colors.white, Colors.green, Colors.lightBlueAccent],
                iconTheme: IconThemeData(color: Colors.black45),
                activeIconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                titleStyle: TextStyle(color: Colors.black45,fontSize:15),
                activeTitleStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                actionButtonDetails: SCActionButtonDetails(
                    color: Colors.green,
                    icon: Icon(
                      Icons.expand_less,
                      color: Colors.white,
                    ),
                    elevation: 2),
                elevation: 2.0,
                items: [
                  SCBottomBarItem(icon: Icons.verified_user, title: "User", onPressed: () {}),
                  SCBottomBarItem(icon: Icons.supervised_user_circle, title: "Details", onPressed: () {}),
                  SCBottomBarItem(icon: Icons.notifications, title: "Alarms", onPressed: () {}),
                  SCBottomBarItem(icon: Icons.details, title: "New Data", onPressed: () {}),
                ],
                circleItems: [
                  SCItem(icon: Icon(Icons.add), onPressed: () {}),
                  SCItem(icon: Icon(Icons.print), onPressed: () {}),
                  SCItem(icon: Icon(Icons.map), onPressed: () {}),
                ],
                bnbHeight: 80
            ),
            child: Container(
                child: Center(child: Text("Indian Innovation :)",style: TextStyle(fontSize: 30,))
                )
            )
        ),
    );
  }
}

