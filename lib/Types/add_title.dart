import 'package:flutter/material.dart';
import 'package:reddit/materials/textField.dart';

import '../classes/User.dart';

class add_title extends StatefulWidget {
  User user;
  add_title({
    required Key key,
    required this.user,
  }) : super(key: key);
  @override
  State<add_title> createState() => _add_titleState();
}

class _add_titleState extends State<add_title> {
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
            controller: _titleController,
              cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "add Title",
              hintStyle : TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              border: InputBorder.none,
            ),
          ),
        ]
        ),
      ),
    );
  }
}

