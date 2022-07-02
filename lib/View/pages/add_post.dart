import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Request.dart';
import '../../Types/user_type.dart';
import '../../classes/Community.dart';

class add_post extends StatefulWidget {
  User user = new User(password: '74856965', name: 'eihhh', email: '', imagePath: '');
  add_post({
    required Key key,
    //required this.user,
  }) : super(key: key);
  @override
  State<add_post> createState() => _add_postState(user: this.user);
}



class _add_postState extends State<add_post> {
  User? user;
  Community? community;
  late TextEditingController titleController;
  late TextEditingController descController;
  late DateTime dateC;

  _add_postState({required this.user});


  @override
  void initState() {
    titleController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Add Post")),
      backgroundColor: Colors.blueGrey,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
            ),
            onPressed:  () async {
              String ans = await Request.sendThenGetMassage("addPost_" + titleController.text + "-" + descController.text + "-,");
              print(ans);
            },
            child: Text("Next",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ) ,))
      ],
    ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 5),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintText: "       Add Title",
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              )
                          ),
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}