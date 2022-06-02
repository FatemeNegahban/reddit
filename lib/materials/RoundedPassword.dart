import 'package:flutter/material.dart';
import 'textField.dart';
import 'constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  String password = " ";
  String username = " ";
  bool passwordVisible = false;
  bool passwordValid = false;
   RoundedPasswordField({
    required Key key,
    required this.onChanged,
     required this.username,
     required this.password,
     this.passwordVisible = false,
     this.passwordValid = false,
  }) : super(key: key);

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
  }

  void usernameChanged(String input) {
    username = input;
  }

  void passwordChanged(String input) {
    password = input;
    validatePassword();
  }

  void validatePassword() {
    if (password.length >= 8) {
      passwordValid = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: Key("password_input"),
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: FPrimaryLight,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: FPrimaryLight,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: FPrimaryLight,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

