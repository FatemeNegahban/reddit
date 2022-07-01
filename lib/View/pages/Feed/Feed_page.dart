import 'package:flutter/material.dart';
import 'package:reddit/View/pages/Feed/FeedView.dart';
import '../../../Types/user_type.dart';
import '../CommunityView.dart';
import '../Profile_page.dart';
import '../add_post.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  User myuser = UserPreferences.myUser;
  int PageIndex = 0;

  List<Widget> Pagelist = <Widget>[
    FeedView(),
    CommunityView(),
    add_post(key: Key("key")),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pagelist[PageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        currentIndex: PageIndex,
        onTap: (value){
          setState(() {
            PageIndex = value;
          });
         },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(radius: 13, backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
            ),
            label: '',
          ),
        ],
      ),
      );
  }
}

