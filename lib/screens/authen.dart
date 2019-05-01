import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './register.dart';
import './my_service.dart';

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
  //explcit
  String emailString, passwordString;
  //for firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  //for snackbar
  final snackBarKey = GlobalKey<ScaffoldState>();
  // initial method  check สภาวะ ่าlogin อยู่รึเปล่า
  @override
  void initState() {
    super.initState();
    print('initState work');
     checkStatus(context);
  }

  Future checkStatus(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      goToService(context);
    }
  }

  void goToService(BuildContext context) {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => Myservice());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

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
      onSaved: (String value) {
        emailString = value;
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
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget singinButton(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.account_circle),
      label: Text('Sign in'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.greenAccent[400],
      onPressed: () {
        print('You Click Signin');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          //${value} {} เมื่อค่าเอามาคำนวน ${8+1} เป็นต้น
          print('email ==> ${emailString},password ==> ${passwordString}');
          checkAuthen(context);
        }
      },
    );
  }

  void checkAuthen(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objValue) {
      print('Success login ==> ${objValue.toString()}');
      //route with arrow back

      var myServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => Myservice());
      Navigator.of(context)
          .pushAndRemoveUntil(myServiceRoute, (Route<dynamic> route) => false);
    }).catchError((objValue) {
      String error = objValue.message;
      print('Error ==> $error');
      showSnackBar(error);
    });
  }

  void showSnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    snackBarKey.currentState.showSnackBar(snackBar);
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
        key: snackBarKey,
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
                        child: singinButton(context),
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
