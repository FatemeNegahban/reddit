import 'package:flutter/material.dart';
import 'textField.dart';
import 'constant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  String password = " ";
  String username = " ";
  bool passwordVisible = false;
  bool passwordValid = false;
   RoundedPasswordField({
    required Key key,
    required this.onChanged,
     this.password = " ",
     this.username = " ",
     this.passwordVisible = false,
     this.passwordValid = false,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      widget.passwordVisible = !widget.passwordVisible;
    });
  }

  void usernameChanged(String input) {
    widget.username = input;
  }

  void passwordChanged(String input) {
    widget.password = input;
    validatePassword();
  }

  void validatePassword() {
    if (widget.password.length >= 8) {
      widget.passwordValid = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: Key("password_input"),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        onChanged: widget.onChanged,
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