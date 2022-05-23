import 'package:flutter/material.dart';
//import 'View/Pages/home_page.dart';
import 'package:reddit/Screens/Login.dart';

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
          primarySwatch: Colors.blue
        //primarySwatch: Colors.amber,
      ),
      //home: LoginScreen(),
      //home: HomePage(),
    );
  }
}
