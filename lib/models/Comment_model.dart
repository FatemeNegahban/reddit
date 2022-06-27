import 'package:reddit/models/post_model.dart';
import 'package:reddit/models/user_model.dart';
class Comment{
  Comment({required this.myPost,required this.commenter,required this.comment});
late final Post myPost;
late final User commenter;
late final String comment;
}