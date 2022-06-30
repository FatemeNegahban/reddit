import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/View/pages/EditProfile.dart';
import '../../Types/user_type.dart';
import '../widgets/Appbar_setting.dart';
import '../widgets/Profile.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: //buildAppBar(context),
      AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color:  Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Edit Profile',
    onClicked: () => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => EditProfilePage())),
  );

}