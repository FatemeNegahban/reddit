import 'package:flutter/material.dart';

class Comments extends StatefulWidget {

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Text('Comments');
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



