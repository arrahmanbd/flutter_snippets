import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new FlutterSwiper());

class FlutterSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'Flutter Swiper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                        width: 300.00,
                        height: 300.00,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: new DecorationImage(
                            image: ExactAssetImage('assets/images/bg${index}.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        )
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  autoplay: true,
                  itemHeight: 500,
                  itemWidth: 350,
                  pagination: new SwiperPagination(),
                  layout: SwiperLayout.STACK,
                ),
                SizedBox(height: 50,),

              ]),
        )
    );
  }
}
