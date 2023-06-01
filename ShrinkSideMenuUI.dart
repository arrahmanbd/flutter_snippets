import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:liquid_ui/liquid_ui.dart';
void main() {
  runApp(ShrinkSideMenuUI());
}

class ShrinkSideMenuUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidApp(
        materialApp: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.green),
          debugShowCheckedModeBanner: false,
          home:MyHomePage(title: 'Liquid UI Shrink Side Menu'),
        )
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
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return  SideMenu(
      key: _sideMenuKey,
      background: Colors.green,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              final _state = _sideMenuKey.currentState;
              if (_state.isOpened)
                _state.closeSideMenu();
              else
                _state.openSideMenu();
            },
          ),
          title: Text(widget.title),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                LText(
                  "\l.lead{Indian}\n\l.lead.bold{Innovation}",
                  baseStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.home, size: 20.0, color: Colors.white),
            title: Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.verified_user, size: 20.0, color: Colors.white),
            title: Text("Profile"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading:
            Icon(Icons.monetization_on, size: 20.0, color: Colors.white),
            title: Text("Wallet"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
            title: Text("Cart"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: Text("Favorites"),
            textColor: Colors.white,
            dense: true,
          ),
          LListItem(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: Text("Settings"),
            textColor: Colors.white,
            dense: true,
          ),
        ],
      ),
    );
  }
}