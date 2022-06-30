import 'package:flutter/material.dart';
import 'package:reddit/View/pages/Profile_page.dart';
import 'package:reddit/signUp/signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey
      ),
      home: signUpScreen(),
    );
  }
}