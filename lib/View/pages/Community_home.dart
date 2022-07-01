import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/classes/Community.dart';

import '../../Types/Comments.dart';
import '../../Types/user_type.dart';
import '../../classes/Post.dart';
import 'Feed/Feed_cubit.dart';

class CommunityHome extends StatefulWidget{
  late int Index;

  CommunityHome({
    required this.Index,
  });

  @override
  State<CommunityHome> createState() => _CommunityHomeState();
}

class _CommunityHomeState extends State<CommunityHome> {
  User myuser = UserPreferences.myUser;
  //int input = 0;
  bool Liked = false , Disliked = false;
  Post post = new Post(id: '');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
            ),
            backgroundColor: Colors.blueGrey,
            bottom: TabBar(
              tabs: [
                Tab(
                  height: 140.0,
                  icon: CircleAvatar(radius: 50,backgroundImage: NetworkImage(CommunitiesData[widget.Index].profileimage),),
                  text: CommunitiesData[widget.Index].name,
                ),
              ],
            ),
          ),
          body: ListView.builder(
            itemCount: 1,
              itemBuilder: (context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _postAuthorRow(context,widget.Index),
                  _postImage(widget.Index),
                  _postdesc(widget.Index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 40.0 , left: 20.0)),
                      GestureDetector(
                        onTap: () async {
                          setState((){
                            if(post.likeCount!.contains(UserPreferences.myUser) == post.dislikeCount!.contains(UserPreferences.myUser)){
                              post.likeCount!.add(UserPreferences.myUser);
                              post.likeCount!.remove(UserPreferences.myUser);
                              Disliked = !Disliked;
                              Liked = !Liked;
                            }
                            else if( post.likeCount!.contains(UserPreferences.myUser)){
                              post.dislikeCount!.remove(UserPreferences.myUser);
                              Liked = !Liked;
                            }
                            post.likeCount!.add(UserPreferences.myUser);
                            Liked = !Liked;
                          });
                        },
                        child: Icon( Liked ? Icons.thumb_up : Icons.thumb_up_alt_outlined , size: 27,),
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0 , left: 20.0)),
                      GestureDetector(
                        onTap: () async {
                          setState((){
                            if(post.likeCount!.contains(UserPreferences.myUser) == post.dislikeCount!.contains(UserPreferences.myUser)){
                              post.likeCount!.remove(UserPreferences.myUser);
                              post.dislikeCount!.add(UserPreferences.myUser);
                              Disliked = !Disliked;
                              Liked = !Liked;
                            }
                            else if( post.dislikeCount!.contains(UserPreferences.myUser)){
                              post.dislikeCount!.remove(UserPreferences.myUser);
                              Disliked = !Disliked;
                            }
                            post.dislikeCount!.add(UserPreferences.myUser);
                            Disliked = !Disliked;
                          });
                        },
                        child: Icon( Liked ? Icons.thumb_down : Icons.thumb_down_alt_outlined , size: 27,),
                      ),
                      Padding(padding: EdgeInsets.only(right: 20.0)),
                      GestureDetector(
                        onTap: () => ShowComments(context,postId: post.id, ownerId: myuser.name,),
                        child: Icon( Icons.chat, size: 27.0,),
                      )
                    ],
                  )
                ],
              );
              }
          ),
        )
    );
  }

  ShowComments(BuildContext context,{required String postId , required String ownerId }){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Comments(
        postId: postId,
        ownerId: ownerId,
      );
    }));
  }

}

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
