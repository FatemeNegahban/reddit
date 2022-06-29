import 'package:flutter/material.dart';
import 'package:reddit/login/Login.dart';
import 'classes/User.dart';

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
          primarySwatch: Colors.blueGrey
      ),
      home: LoginScreen(),
    );
  }
}