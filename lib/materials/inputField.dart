import 'package:flutter/material.dart';
import 'textField.dart';

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
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Colors.black,
          ),
          hintText: widget.hintText,
          hintStyle : TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}