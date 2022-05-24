import 'package:reddit/Types/community_type.dart';
import 'package:reddit/Types/post_type.dart';
class User{
  User(this.userId,this._password);
  late final String userId;
  late final String _password;
  late String avatar;
  late List<Post> myPosts;
  late List<Community> followings;
  set setAvatar(String avatar){
    this.avatar=avatar;
  }
  String get getAvatar{
    return avatar;
  }
  String get getPassword{
    return _password;
  }
}