import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

void main() => runApp(SideMenuAnimationUI());

class SideMenuAnimationUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SideMenuAnimation-Example',
      home: SampleScreen(),
    );
  }
}

class SampleScreen extends StatelessWidget {
  void _goToExample(BuildContext context, Widget newPage) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => newPage));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SideMenuAnimation-Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoButton(
              color: Colors.blueAccent,
              pressedOpacity: .75,
              child: Text('SideMenuAnimation'),
              onPressed: () => _goToExample(context, SideMenuScreen()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.blueAccent,
              pressedOpacity: .75,
              child: Text('SideMenuAnimation.builder'),
              onPressed: () => _goToExample(context, SideMenuBuilderScreen()),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

class MenuValues {
  const MenuValues({this.title, this.icon, this.items, this.color});
  final String title;
  final IconData icon;
  final Color color;
  final List<MenuValues> items;
}

const myMenuValue = const [
  MenuValues(icon: Icons.close),
  MenuValues(
    icon: Icons.library_music,
    title: 'Music',
    items: const [
      MenuValues(
          icon: Icons.music_note, title: 'Songs', color: Color(0xFF5863F8)),
      MenuValues(
          icon: Icons.play_arrow,
          title: 'Now Playing',
          color: Color(0xFFFF3366)),
      MenuValues(icon: Icons.album, title: 'Albums', color: Color(0xFFFFE433)),
    ],
  ),
  MenuValues(
    icon: Icons.bluetooth,
    title: 'Calls',
    items: const [
      MenuValues(
          icon: Icons.phone_forwarded,
          title: 'Incoming',
          color: Color(0xFF2CDA9D)),
      MenuValues(
          icon: Icons.phone_missed,
          title: 'Missing',
          color: Color(0xFF7678ED)),
      MenuValues(
          icon: Icons.phone_in_talk,
          title: 'Outgoing ',
          color: Color(0xFF446DF6)),
    ],
  ),
  MenuValues(
    icon: Icons.cloud,
    title: 'Cloud',
    items: const [
      MenuValues(
          icon: Icons.file_download,
          title: 'Downloading',
          color: Color(0xFFFF4669)),
      MenuValues(
          icon: Icons.file_upload, title: 'Done', color: Color(0xFFFF69EB)),
      MenuValues(
          icon: Icons.cloud_upload, title: 'Upload', color: Color(0xFF2CDA9D)),
    ],
  ),
  MenuValues(
    icon: Icons.wifi,
    title: 'Wifi',
    items: const [
      MenuValues(
          icon: Icons.wifi, title: 'Off', color: Color(0xFF5AD2F4)),
      MenuValues(
          icon: Icons.wifi_lock,
          title: 'Lock',
          color: Color(0xFFFF3366)),
      MenuValues(
          icon: Icons.network_wifi,
          title: 'Limit',
          color: Color(0xFFFFC07F)),
    ],
  ),
  MenuValues(
    icon: Icons.favorite,
    title: 'Favorites',
    items: const [
      MenuValues(
          icon: Icons.favorite, title: 'Favorite', color: Color(0xFF5863F8)),
      MenuValues(
          icon: Icons.favorite_border,
          title: 'Not Favorite',
          color: Color(0xFFF7C548)),
      MenuValues(
          icon: Icons.local_activity,
          title: 'Activism',
          color: Color(0xFF00A878)),
    ],
  ),
  MenuValues(
    icon: Icons.network_cell,
    title: 'Networks',
    items: const [
      MenuValues(icon: Icons.wifi, title: 'Wifi', color: Color(0xFF96858F)),
      MenuValues(
          icon: Icons.network_cell, title: 'Network', color: Color(0xFF6D7993)),
      MenuValues(
          icon: Icons.bluetooth, title: 'Bluetooth', color: Color(0xFF9099A2)),
    ],
  ),
];

class Screen extends StatelessWidget {
  const Screen({Key key, @required this.itemsScreen}) : super(key: key);

  final List<MenuValues> itemsScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemsScreen.length,
            (index) => Expanded(
          child: Container(
            color: itemsScreen[index].color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(itemsScreen[index].icon, size: 75, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  itemsScreen[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SideMenuBuilderScreen extends StatelessWidget {
  final _index = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideMenuAnimation.builder(
        builder: (showMenu) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.menu, color: Colors.black),
                  onPressed: showMenu),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              brightness: Brightness.light,
              centerTitle: true,
              title: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, value, __) => Text(myMenuValue[value].title,
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            body: ValueListenableBuilder<int>(
              valueListenable: _index,
              builder: (_, value, __) => IndexedStack(
                index: value - 1,
                children: List.generate(
                  myMenuValue.length - 1,
                      (index) => Screen(itemsScreen: myMenuValue[index + 1].items),
                ),
              ),
            ),
          );
        },
        enableEdgeDragGesture: true,
        items: myMenuValue
            .map((value) => Icon(value.icon, color: Colors.white, size: 50))
            .toList(),
        selectedColor: Color(0xFFFF595E),
        unselectedColor: Color(0xFF1F2041),
        onItemSelected: (value) {
          if (value > 0 && value != _index.value) _index.value = value;
        },
      ),
    );
  }
}

class SideMenuScreen extends StatelessWidget {
  final _index = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideMenuAnimation(
        appBarBuilder: (showMenu) => AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black), onPressed: showMenu),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          brightness: Brightness.light,
          centerTitle: true,
          title: ValueListenableBuilder<int>(
            valueListenable: _index,
            builder: (_, value, __) => Text(myMenuValue[value].title,
                style: TextStyle(color: Colors.black)),
          ),
        ),
        views: List.generate(
          myMenuValue.length - 1,
              (index) => Screen(itemsScreen: myMenuValue[index + 1].items),
        ),
        position: SideMenuPosition.right,
        items: myMenuValue
            .map((value) => Icon(value.icon, color: Colors.white, size: 50))
            .toList(),
        selectedColor: Color(0xFFFF595E),
        unselectedColor: Color(0xFF1F2041),
        tapOutsideToDismiss: true,
        scrimColor: Colors.black45,
        onItemSelected: (value) {
          if (value > 0 && value != _index.value) _index.value = value;
        },
      ),
    );
  }
}
