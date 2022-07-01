//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:reddit/signUp/signup.dart';
import 'body.dart';

class LoginScreen extends StatelessWidget {
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
                  .push(MaterialPageRoute(builder: (_) => signUpScreen())),
              child: Text("Sign up",
                style: TextStyle(
                  color: Colors.white,
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