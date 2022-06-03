import 'package:flutter/material.dart';
import 'textField.dart';
import 'constant.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  String password = " ";
  String username = " ";
  RoundedPasswordField({
    required Key key,
    required this.onChanged,
    this.password = " ",
    this.username = " ",
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  bool passwordVisibility = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: Key("password_input"),
      child: TextField(
        obscureText: passwordVisibility,
        controller: _passwordController,
        onChanged: widget.onChanged,
        cursorColor: FPrimaryLight,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: FPrimaryLight,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisibility ? Icons.visibility : Icons.visibility_off,
              color: FPrimaryLight,
            ), onPressed: () { setState(() {
            passwordVisibility = !passwordVisibility;
          });},
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}