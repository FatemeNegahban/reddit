import 'package:flutter/material.dart';
import 'textField.dart';
import 'constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    required Key key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged, hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: Key("pass_input"),
      child: TextField(
        onChanged: onChanged,
        cursorColor: FPrimaryLight,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: FPrimaryLight,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}