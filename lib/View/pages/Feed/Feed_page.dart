import 'package:flutter/material.dart';
import 'package:reddit/View/pages/Feed/FeedView.dart';
import '../../../navigation/navigation_bar.dart';


class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        prototypeItem: NaviBar(),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          //return PostCard();
          return FeedView();
        },
      ),
    );
  }
}