import 'package:flutter/material.dart';
import 'textField.dart';
import 'constant.dart';

class RoundedInputField extends StatefulWidget {
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
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: Key("pass_input"),
      child: TextField(
        controller: _usernameController,
        onChanged: widget.onChanged,
        cursorColor: FPrimaryLight,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: FPrimaryLight,
          ),
          hintText: widget.hintText,
          hintStyle : TextStyle(
            color: FPrimaryLight,
            fontSize: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}