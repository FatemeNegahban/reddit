import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../Types/user_type.dart';
import '../widgets/Appbar_setting.dart';
import '../widgets/Profile.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          padding: EdgeInsets.only(left: 15,top: 20,right: 15),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
              child: Stack(
              //padding: EdgeInsets.symmetric(horizontal: 32)
              //physics: BouncingScrollPhysics(),
              children:[
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {},
                    ),])
                  ),
                SizedBox(height: 30),
                buildTextfield("Name", "user.name", false),
                buildTextfield("Email", "user.email", false),
                buildTextfield("Password", user.password, true),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Text('Save',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 3,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                    )
                  ],
                )
                ],
              ),
          ),
        ),
      );
}

  Widget buildTextfield(String lableText,String placeholder,bool ispassword){
  bool isObscurePassword = true;
  return Padding(
      padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: ispassword ? isObscurePassword : false,
      decoration: InputDecoration(
        suffixIcon: ispassword ?
            IconButton(
                icon: Icon(Icons.remove_red_eye , color: Colors.black),
                onPressed: () {},
            ): null,
            contentPadding: EdgeInsets.only(bottom: 5),
        labelText: lableText,
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    ),
  );
  }