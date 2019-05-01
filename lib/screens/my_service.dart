import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';

class Myservice extends StatefulWidget {
  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    readData();
  }

  void readData() async{
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String currentUid = firebaseUser.uid.toString();
    var objData = firebaseDatabase.reference().child(currentUid);
    print('objData ==> $objData');
    // StreamBuilder(stream: objData.onValue,builder: (BuildContext context,snap),){}
  }

  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        print('Click signOutButton');
        signOutProcess();
      },
    );
  }

  void signOutProcess() async {
    //signout from firebase
    await firebaseAuth.signOut();
    //exit app
    // exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Myservice'),
        backgroundColor: Colors.black,
        actions: <Widget>[signOutButton()],
      ),
      body: Text('this body'),
    );
  }
}
