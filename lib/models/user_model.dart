import 'package:reddit/models/post_model.dart';
import 'community_model.dart';
class User{
  User({required this.userId,required this.password});
  late final String userId;
  late final String password;
  late String avatar;
  late List<Post> myPosts;
  late List<Community> followings;

  String get getPassword{
    return password;
  }
}