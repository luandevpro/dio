import 'package:flutter_json/models/user_model.dart';

class Post {
  String id;
  String title;
  String userId;
  User user;

  Post({
    this.id,
    this.title,
    this.userId,
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "userId": userId};
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      title: json["title"],
      user: User.fromJson(json["user"]),
    );
  }
}
