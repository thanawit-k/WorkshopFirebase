import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showAppName() {
    return Text(
      'Show App Name ',
      style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.red),
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pink[100], Colors.pink[300]],begin: Alignment(0, 1))),
        padding: EdgeInsets.only(top: 100.0),
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              child: showLogo(),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: showAppName(),
            ),
          ],
        ),
      ),
    );
  }
}
