import 'dart:html';

import 'package:flutter/material.dart';
import 'package:reddit/login/Login.dart';
import 'body.dart';

class signUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginScreen())),
              child: Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ) ,))
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {  },
        ),
      ),
      body: Body(key: Key("value"), addUser: (){}),
    );
  }
}