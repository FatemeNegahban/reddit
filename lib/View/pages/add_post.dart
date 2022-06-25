import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Types/add_title.dart';

import '../../classes/User.dart';

class add_post extends StatefulWidget {
  User user;
  add_post({
    required Key key,
    required this.user,
  }) : super(key: key);
  @override
  State<add_post> createState() => _add_postState(user: this.user);
}

class _add_postState extends State<add_post> {
  User? user;
  //add community latter
  late TextEditingController _titleController;

  _add_postState({required this.user});


  @override
  void initState() {
    _titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(27, 27, 27, 1),
      appBar: AppBar(
        title: Center(child: Text("Add Post")),
      backgroundColor: Colors.black,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
            onPressed: (){

            },
            child: Text("Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ) ,))
      ],
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {  },
      ),
    ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            hintText: "Add a title",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.0,
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.0,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                      ),
                    ]
                )
            )
        )
    );
  }
}