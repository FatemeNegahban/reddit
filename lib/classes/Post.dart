import 'community.dart';
import 'User.dart';

class Post{
  late String title;
  late String content;
  DateTime createdAt=DateTime.now();
  community? com;
  Object? id;
  Object? image;
  int? likeCount;
  List<String>? comments;
  User? user;

  Post({required this.title, required this.content, this.com, this.id, this.image, this.likeCount,this.comments,this.user});
}