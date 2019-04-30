import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget nameTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: ('Name'), hintText: ('Input your name')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
        child: Column(
          children: <Widget>[nameTextFormField()],
        ),
      ),
    );
  }
}
