import 'package:flutter/material.dart';

void main() => runApp(BalloonLoginUI());

class BalloonLoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndianInnovation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Courier-Prime'),
      home: BLoginPage(),
    );
  }
}

class BLoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<BLoginPage> {
  @override
  Widget build(BuildContext context) {
    Color bg = Color.fromRGBO(245, 207, 198, 1);

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'codestudio@gmail.com',
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: 'Email',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
    );

    final pasword = TextFormField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      autofocus: false,
      initialValue: 'some password',
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: 'Password',
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
    );

    final loginbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.all(12.0),
        color: Colors.red,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          'Log In',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final forgotlabel = FlatButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
        ));

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: bg,
          height: MediaQuery.of(context).size.height - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/ballonlogin.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 24.0,left: 24.0),
                children: <Widget>[
                  email,
                  SizedBox(height: 8.0,),
                  pasword,
                  SizedBox(height: 24.0,),
                  loginbutton,
                  forgotlabel,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
