import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../classes/Community.dart';
import '../../classes/User.dart';
import 'CommunityView.dart';

class CommunityItem extends StatelessWidget {
  CommunityItem({required Key key, required this.community, required this.user}) : super(key: key);

  final Community community;
  User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(community.name),
        leading: Icon(Icons.question_mark_sharp),
        trailing: Container(
          width: 60,
          child: Row(
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return CommunityView(
                          community: community,
                          user: user,
                          key: Key("value"),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}