import 'Community.dart';
import 'Post.dart';

class User {
  String username = " ";
  String password = " ";
  Object? profile_pic;
  static List<User> user_list = [];
  List<Community> communities = [];

  User({
    required this.username,
    required this.password,
    this.profile_pic,
    //this.communities,
  });
  void setUsername(String input) {
    username = input;
  }

  void setPassword(String input) {
    password = input;
  }

  void setProfilePic(Object input) {
    profile_pic = input;
  }


  void addUser(User input) {
    user_list.add(input);
  }

  void addCommunity(Community input) {
    communities.add(input);
  }


}

