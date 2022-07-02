import 'package:flutter/material.dart';
import '../../classes/Community.dart';
import 'Community_home.dart';

class CommunityBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              itemCount: CommunitiesData.length,
                itemBuilder: (context, index) => CommunityItem(
                  community: CommunitiesData[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommunityHome(Index: index,),
                    ),
                  ),
                ),
            ),
        ),
      ],
    );
  }
}

class CommunityItem extends StatelessWidget{
  const CommunityItem({
    Key? key,
    required this.community, required Future Function() press,
}) : super(key: key);
  final Community community;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 20.0 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage:  NetworkImage(community.imagePath),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      community.name,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /*onTap: () => Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context ) => CommunityHome(Index: index)),),*/
    );
  }
}