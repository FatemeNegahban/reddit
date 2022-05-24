import 'package:reddit/Types/community_type.dart';
import 'package:reddit/Types/post_type.dart';
class User{
  late final String userId;
  late final String _password;
  late String avatar;
  late List<Post> myPosts;
  late List<Community> followings;
  User(userId,password){
    this.userId=userId;
    this._password=password;
  }
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