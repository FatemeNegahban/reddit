import 'package:flutter/material.dart';
import 'textField.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  //String PasswordError = "";
   RoundedPasswordField({
    required Key key,
    required this.onChanged,
  //required this.PasswordError,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isObscure = true;
  String PasswordError = "";
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: Key("password_input"),
      child: TextField(
        obscureText: _isObscure,
        onChanged: widget.onChanged,
        cursorColor: Colors.grey[400],
        decoration: InputDecoration(
          hintText: "Password",
          //errorText: PasswordError,
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}