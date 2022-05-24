import 'package:reddit/Types/user_type.dart';
import 'Comment_type.dart';
class Post{
  late final User author;
  late final String title, summary, body, image;
  late final DateTime postTime;
  late final List<Comment> comments;
  late final List<User> likes;
  late final List<User> dislikes;
}