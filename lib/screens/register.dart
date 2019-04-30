import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget nameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(width: 1.0, color: Colors.black12)),
          labelText: ('Name'),
          hintText: ('Input your name'),
          icon: Icon(Icons.face, color: Colors.black)),
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(width: 1.0, color: Colors.black12)),
          labelText: ('email'),
          hintText: ('Input your email'),
          icon: Icon(Icons.email, color: Colors.black)),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(width: 1.0, color: Colors.black12)),
          labelText: (' password'),
          hintText: ('Input your  password'),
          icon: Icon(Icons.lock, color: Colors.black)),
      obscureText: true,
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload to firebase',
      onPressed: (){
        print("uploadButton");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.yellowAccent[400], Colors.yellowAccent[700]],
                radius: 2,
                center: Alignment(0, 0))),
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: nameTextFormField(),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: emailTextFormField(),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: passwordTextFormField(),
            ),
          ],
        ),
      ),
    );
  }
}
