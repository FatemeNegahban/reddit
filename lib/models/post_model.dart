import 'dart:html';

import 'package:reddit/models/user_model.dart';

import 'community_model.dart';

class Post{
  Post({required this.community,required this.author,required this.title,required this.body,});
  late final User author;
  late final Community community;
  late final String title, body;
 // late final DateTime postTime;
  late final List<Comment> comments;
  late final int numberOfComments;
  late final List<User> likes;
  late final int numberOfLikes=0;
  late final List<User> dislikes;
  late final int numberOfDislikes=0;
}