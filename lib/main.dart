import 'package:flutter/material.dart';
//import 'package:reddit/Login/Login.dart';
import 'package:reddit/View/pages/add_post.dart';

import 'classes/User.dart';
//import 'package:reddit/signUp/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  User user = new User(username: 'minmin', password: '2727777');
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: add_post(
        user: this.user, key: Key("add post"),
      ),
    );
  }
}