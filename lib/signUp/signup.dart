import 'dart:html';

import 'package:flutter/material.dart';
import 'body.dart';

class signUpScreen extends StatelessWidget {
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
                //Navigator.push(context, MaterialPageRoute(builder: (context) => feed() ));
              },
              child: Text("Login",
                style: TextStyle(
                  color: Colors.blue,
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