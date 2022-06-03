import 'dart:developer';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../materials/RoundedButton.dart';
import '../materials/inputField.dart';
import '../materials/Roundedpassword.dart';

class Body extends StatefulWidget {
  Function addUser;
  Body({
    required Key key,
     required this.addUser,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState(addUser : addUser);
}

class _BodyState extends State<Body> {
  Function addUser;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  _BodyState({
    required this.addUser,
});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create an account",style: TextStyle(color : Colors.white,fontSize: 27),),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Email",
                    onChanged: (value) {
                      _usernameController.text = value;
                    }, key: Key("email_input"),
                    hintStyle: Colors.white,
                  ),
                  RoundedInputField(
                    hintText: "Username",
                    onChanged: (value) {
                      _usernameController.text = value;
                    }, key: Key("username_input"),
                    hintStyle: Colors.white,
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      _passwordController.text = value;
                    }, key: Key("password_input"),
                  ),
                  RoundedButton(
                    text: "Continue",
                    press: () {}, key: Key("continue_input"),
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