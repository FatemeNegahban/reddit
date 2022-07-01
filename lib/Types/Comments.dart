import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  String postId;
  String ownerId;

  Comments({
    required this.postId,
    required this.ownerId,
});

  @override
  CommentsState createState() => CommentsState(
    postId: this.postId,
    ownerId: this.ownerId,
  );
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String ownerId;

  CommentsState({
    required this.postId,
    required this.ownerId,
  });

  buildComments(){
    return Text("Comments");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Comments")),
      ),
      //header(context,titleText: "Comments"),
      body: Column(
        children: <Widget>[
          Expanded( child: buildComments()),
          Divider(),
          ListTile(
            title:TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: "Write a Comment...",
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () => print('Add Comment'),

              //borderside: BorderSide.none,
              child: Text("Post"),
            ),
          ),
        ],
      ),
    );
  }
}
 
class Comment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}


  /*Widget _commentView() {
    const double avatarDiameter = 44;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: avatarDiameter,
            height: avatarDiameter,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(avatarDiameter / 2),
              child: Image(
                image: NetworkImage('https://i.pinimg.com/564x/b9/15/32/b91532ba24117f5ca14be73f6081d843.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Flexible(
          child: Text(
            'Hi!',
            maxLines: 5,
          ),
        )
      ],
    );
  }

  Widget _commentsListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return _commentView();
      },
    );
  }
}*/



