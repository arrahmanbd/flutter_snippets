import 'package:flutter/material.dart';
void main() {
  runApp(SignUpUI());
}

class SignUpUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:CSLoginPage(),
    );
  }
}
class CSLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final solgan = Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'Get the Best Coffee in Town',
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.brown, fontSize: 40.0),
          textAlign: TextAlign.center,
        ));

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: RaisedButton(
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(12),
          color: Colors.brown,
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ),
    );
    final loginbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: OutlineButton(
          onPressed: () {

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(12),
          color: Colors.brown,
          child: Text(
            'Login',
            style: TextStyle(color: Colors.brown, fontSize: 12.0),
          ),
        ),
      ),
    );

    final googlebutton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
            height: 40,
            width: 10,
            child: OutlineButton(
                onPressed: () => null,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.mail,color: Colors.blue,),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Connect With Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue),
                        )
                    )
                  ],
                ),
                highlightedBorderColor: Colors.blue,
                color: Colors.blue,
                borderSide: new BorderSide(color: Colors.blue),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0)
                )
            ))
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/coffe_cart.jpeg"),
                          fit: BoxFit.scaleDown),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    children: <Widget>[
                      solgan,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[loginbutton, registerButton],
                      ),
                      googlebutton
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
