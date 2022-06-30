import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/classes/Community.dart';
import '../../../Types/user_type.dart';
import '../../../navigation/navigation_cubit.dart';
import '../Search_page.dart';
import 'Feed_cubit.dart';



class FeedView  extends StatefulWidget {
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  User myuser = UserPreferences.myUser;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NaveCubit(),
        child: BlocBuilder<NaveCubit, int>(builder: (context, state)
    {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Search")),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: _postsListView(context),
      );
    }));
  }}

Widget _postAuthorRow(BuildContext context,int index) {
  const double avatarDiameter = 44;
  return GestureDetector(
    onTap: () => BlocProvider.of<FeedNavigatorCubit>(context).showProfile(),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: avatarDiameter,
            height: avatarDiameter,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(avatarDiameter / 2),
              child: Image(
                image: NetworkImage(CommunitiesData[index].profileimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          CommunitiesData[index].name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    ),
  );
}

Widget _postImage(int index) {
  return AspectRatio(
    aspectRatio: 2,
    child: Image(
      fit: BoxFit.cover,
      image: NetworkImage(CommunitiesData[index].imagePath),
    ),
  );
}

Widget _postdesc(int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4,
    ),
    child: Text(
        CommunitiesData[index].description),
  );
}

Widget _postView(BuildContext context , int index) {
  bool Liked = false , Disliked = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _postAuthorRow(context,index),
      _postImage(index),
      _postdesc(index),
      Container(
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon( Liked ? Icons.favorite : Icons.favorite_border , size: 33,),
                    onPressed: () {

                    },),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}


Widget _postsListView(BuildContext context) {
  return ListView.builder(
      itemCount: CommunitiesData.length,
      itemBuilder: (context, index) {
        return _postView(context,index);
      });
}
