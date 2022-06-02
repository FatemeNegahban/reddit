import 'dart:html';

import 'package:flutter/material.dart';
import 'body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.black)
              ),
              onPressed: (){

              },
              child: Text("Sign up",
                style: TextStyle(
                  color: Colors.blue,
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