import 'package:flutter/material.dart';
import 'package:reddit/View/pages/Community_home.dart';
import 'package:reddit/View/pages/Feed/Feed_page.dart';
import 'package:reddit/View/pages/add_post.dart';
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
      home: CommunityHome(Index: 1,),
    );
  }
}