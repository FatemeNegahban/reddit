import 'package:flutter/material.dart';
import 'textField.dart';


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
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle : TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisibility ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
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