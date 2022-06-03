import 'package:reddit/Types/user_type.dart';
import 'Comment_type.dart';
//import 'package:intl/intl.dart';
class Post{
  late final String id, title, summary, body, imageURL;
  late final DateTime postTime;
  late final int reacts, views;
  late final User author;
  late final List<Comment> comments;
 // String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}