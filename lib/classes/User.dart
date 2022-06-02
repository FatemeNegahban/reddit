class User {
  String username = " ";
  String password = " ";
  Object? profile_pic;
  List<User> user_list = [];
  //List<Community> communities = [];

  User({
    required this.username,
    required this.password,
    this.profile_pic,
    required this.user_list,
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

  /*void addCommunity(Community input) {
    //communities.add(input);
  }*/


}

