import 'package:reddit/Types/post_type.dart';
import 'package:reddit/Types/user_type.dart';
class Comment{
  Comment(this.myPost,this.commenter,this.comment);
late final Post myPost;
late final User commenter;
late final String comment;
}