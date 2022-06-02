import 'package:reddit/Types/post_type.dart';
import 'package:reddit/Types/user_type.dart';
class Community{
  late final User admin;
  late final List<User> followers;
  late final List<Post> posts;
}