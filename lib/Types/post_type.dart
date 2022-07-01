import 'dart:html';
import 'package:reddit/Types/user_type.dart';

class Post{
  late List<Post> post;
  late final String id, title, summary, body, imageURL;
  late final DateTime postTime;
  late final User author;
  late final List<Comment> comments;
}