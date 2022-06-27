import 'package:reddit/models/post_model.dart';
import 'package:reddit/models/user_model.dart';

class Community{
  Community({required this.communityName});
  late final String communityName;
  late final User admin;
  late final List<User> followers;
  late final List<Post> posts;
}