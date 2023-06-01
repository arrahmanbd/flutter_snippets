import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: HomeScreen(),
    );
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      primaryIconTheme: base.iconTheme.copyWith(color: Colors.black));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  bool showRaisedButtonBadge = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: AppBar(
          leading: Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: null,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          title: Text('Badge Demo', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            _shoppingCartBadge(),
          ],
          bottom: _tabBar(),
        ),
        body: Column(
          children: <Widget>[
            _addRemoveCartButtons(),
            _textBadge(),
            _raisedButtonBadge(),
          ],
        ),
      ),
    );
  }

  Widget expandedBadge() {
    return Expanded(
      child: Center(
        child: Badge(
          badgeContent: Text('10'),
          child: Icon(Icons.person, size: 30),
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  Widget _tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: Badge(
          badgeColor: Colors.blue,
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.account_balance_wallet, color: Colors.grey),
        ),
      ),
      Tab(
        icon: Badge(
          shape: BadgeShape.square,
          position: BadgePosition.topEnd(top: -12, end: -20),
          padding: EdgeInsets.all(2),
          badgeContent: Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: Text(
            'MUSIC',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    ]);
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text('Events'),
          icon: Icon(Icons.event),
        ),
        BottomNavigationBarItem(
          title: Text('Messages'),
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          title: Text('Settings'),
          icon: Badge(
            shape: BadgeShape.circle,
            child: Icon(Icons.settings),
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add to cart')),
          RaisedButton.icon(
              onPressed: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                  });
                }
              },
              icon: Icon(Icons.remove),
              label: Text('Remove from cart')),
        ],
      ),
    );
  }

  Widget _textBadge() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Badge(
          padding: EdgeInsets.all(6),
          badgeContent: Text(
            '!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          child: Text('This is a text'),
          position: BadgePosition.topStart(top: -15)),
    );
  }

  Widget _raisedButtonBadge() {
    return Badge(
      showBadge: showRaisedButtonBadge,
      padding: EdgeInsets.all(8),
      badgeColor: Colors.deepPurple,
      badgeContent: Text(
        '!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            showRaisedButtonBadge = !showRaisedButtonBadge;
          });
        },
        child: Text('Raised Button'),
      ),
    );
  }

  Widget _chipWithZeroPadding() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text('Chip with zero padding:'),
      Chip(
        label: Text('Hello'),
        padding: EdgeInsets.all(0),
      ),
    ]);
  }

  Widget _badgeWithZeroPadding() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Badges:'),
        for (int i = 0; i < 5; i++)
          _getExampleBadge(padding: (i * 2).toDouble())
      ],
    );
  }

  Widget _getExampleBadge({double padding}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Badge(
        badgeColor: Colors.lightBlueAccent,
        padding: EdgeInsets.all(padding ?? 4),
        shape: BadgeShape.square,
        badgeContent: Text(
          'Hello',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
