import '../Types/user_type.dart';
import 'Community.dart';

class Post{
  late String title;
  //late String content;
  DateTime createdAt=DateTime.now();
  Community? community;
  String? id;
  String? image;
  int? likeCount;
  int? dislikeCount;
  List<String>? comments;
  User? user;
  List<Post> posts = [];

  Post({required this.title, this.community, this.id, this.image, this.likeCount,this.comments,this.user});
}