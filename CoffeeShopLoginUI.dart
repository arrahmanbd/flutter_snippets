import 'package:flutter/material.dart';
void main() {
  runApp(CoffeeShopLoginUI());
}

class CoffeeShopLoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:CLoginPage(),
    );
  }
}

class CLoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<CLoginPage>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color bg = Color(0xFFB98068);

    final sketch=Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(bg,BlendMode.overlay),
            image: AssetImage("assets/cart2.jpg"),
            fit: BoxFit.cover),
      ),
    );
    final solgan = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Welcome Back :)',
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Color(0xFFB98068), fontSize: 40.0),
          textAlign: TextAlign.start,
        ));

    final email = TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail_outline,
            color: bg,
          ),
          hintText: 'codestudio@gmail.com',
          labelText: 'E-mail'),
    );

    final pasword = TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.security,
            color: bg,
          ),
          labelText: 'Password'),
    );

    final loginbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {
        },
        padding: EdgeInsets.all(12.0),
        color: bg,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        child: Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w300),
        ),
      ),
    );

    final forgotlabel = FlatButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style:
          TextStyle(color: bg, fontSize: 15.0, fontWeight: FontWeight.w400),
        ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 220,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Login Page',
                                style: TextStyle(
                                    color: bg,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                solgan,
                SizedBox(
                  height: 25.0,
                ),
                email,
                SizedBox(
                  height: 25.0,
                ),
                pasword,
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: forgotlabel,
                ),
                SizedBox(
                  height: 15.0,
                ),
                loginbutton,
                SizedBox(
                  height: 25.0,
                ),
                Expanded(child: sketch)
              ]),
        ));
  }
}
