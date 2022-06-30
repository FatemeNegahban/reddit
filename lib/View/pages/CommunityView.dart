import 'package:flutter/material.dart';
import 'package:reddit/View/pages/Community_body.dart';

import 'Search_page.dart';

class CommunityView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Search")),
          leading: BackButton(
          ),
          actions: [
          IconButton(
          icon: Icon(Icons.search),
      color:  Colors.white,
      onPressed: () =>
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SearchPage())),
          ),
          ]
      ),
      body: CommunityBody(),
    );
  }
}