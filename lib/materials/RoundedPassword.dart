/*import 'package:flutter/material.dart';
import 'textField.dart';
import 'constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    required Key key,
    required this.onChanged,
  }) : super(key: key);

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
 */