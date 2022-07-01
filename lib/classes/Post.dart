import '../Types/user_type.dart';
import 'Community.dart';

class Post{
  late String? title;
  DateTime createdAt=DateTime.now();
  Community? community;
  String? id;
  String? image;
  List<User>? likeCount = [User(imagePath: '', name: 'min', email: 'mini', password: '')];
  List<User>? dislikeCount = [User(imagePath: '', name: 'min', email: 'mini', password: '')];
  List<String>? comment ;
  User? user;
  List<Post> posts = [];

  Post({this.title, this.community, this.id, this.image , this.dislikeCount , this.likeCount,this.comment,this.user});
}