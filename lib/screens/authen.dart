import 'package:flutter/material.dart';
import './register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // for form
  final formKey = GlobalKey<FormState>();

  //constant
  String titleHaveSpace = 'Please fill in the information';
  String titleEmailFalse = 'Input your Email format';
  String titlePasswordFalse = 'Input your password more than 6 character';

  Widget emailTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'email', hintText: 'example@email.com'),
      validator: (String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (value.length == 0) {
          return titleHaveSpace;
        } else if (!regex.hasMatch(value)) {
          return titleEmailFalse;
        }
      },
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'password', hintText: 'your password'),
      obscureText: true,
      validator: (String value) {
        if (value.length < 6) {
          return titlePasswordFalse;
        }
      },
    );
  }

  Widget singinButton() {
    return RaisedButton.icon(
      icon: Icon(Icons.account_circle),
      label: Text('Sign in'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.greenAccent[400],
      onPressed: () {
        print('You Click Signin');
        if (formKey.currentState.validate()) {}
      },
    );
  }

  Widget singupButton(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.person_add),
      label: Text('Sign up'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.redAccent,
      onPressed: () {
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showAppName() {
    return Text(
      'Show App Name ',
      style: TextStyle(
          fontFamily: 'IndieFlower',
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow[800], Colors.yellowAccent[400]],
                    begin: Alignment(0, 1))),
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
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: emailTextFormField(),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: passwordTextFormField(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 4.0, right: 4.0),
                        child: singinButton(),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 4.0, right: 4.0),
                        child: singupButton(context),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
