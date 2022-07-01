import 'dart:developer';
//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../Types/user_type.dart';
import '../View/pages/Feed/Feed_page.dart';
import '../materials/InputField.dart';
import '../materials/RoundedPassword.dart';

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
  String _usernameError = "";
  String _PasswordError = "";
  String descError = "";
  String emailError = "";
  bool isOk = true;
  RegExp ValidInput = RegExp(
      "^(?=.{8,17}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*");
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
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
                    }, key: Key("password_input"),),
                  ElevatedButton(
                    child: Text(
                      "Continue",
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20)),
                    onPressed: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_usernameController.text.length < 8) {
                          _usernameError =
                          "username must be at least 8 characters long";
                          descError = "";
                        } else if (!ValidInput.hasMatch(
                            _passwordController.text)) {
                          _usernameError = "";
                          descError = "can't use these Characters";
                        } else if (!ValidInput.hasMatch(
                            _emailController.text)) {
                          _usernameError = "";
                          descError = "Email isn't Correct";
                        } else {
                          _usernameError = "";
                          descError = "";
                          if (isOk == true) {
                            User user = new User(
                                name: _usernameController.text,
                                password: _passwordController.text,
                                imagePath: '',
                                email: _emailController.text);
                            Future.delayed(Duration(milliseconds: 500), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedPage()));
                            });
                          } else
                            print("Error");
                        }
                      });
                    },
                    key: Key("continue_input"),
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