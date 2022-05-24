import 'package:reddit/Types/user_type.dart';
import 'Comment_type.dart';
class Post{
  Post(this.author,this.title,this.body,this.postTime);
  late final User author;
  late final String title, body, image;
  late final DateTime postTime;
  late final List<Comment> comments;
  late final List<User> likes;
  late final List<User> dislikes;
}