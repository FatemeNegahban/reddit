import 'dart:developer';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../materials/RoundedButton.dart';
import '../materials/inputField.dart';
import '../materials/RoundedPassword.dart';

class Body extends StatelessWidget {
  const Body({
    required Key key,
  }) : super(key: key);

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
                    hintText: "Username",
                    onChanged: (value) {}, key: Key("username_input"),
                    hintStyle: Colors.white,
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {}, key: Key("value"), username: '', password: '',
                  ),
                  RoundedButton(
                    text: "Continue",
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