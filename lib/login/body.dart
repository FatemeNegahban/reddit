import 'dart:developer';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../materials/RoundedButton.dart';
import '../materials/inputField.dart';
import '../materials/RoundedPassword.dart';

class Body extends StatefulWidget {
  Function addUser;
  Body({
    required Key key,
    required this.addUser,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Log in",style: TextStyle(color : Colors.white,fontSize: 27),),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {}, key: Key("email_input"),
                    hintStyle: Colors.white,
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {}, key: Key("value"),
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {}, key: Key("login_input"),
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}