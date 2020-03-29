class User {
  String id;
  String email;
  String displayName;

  User({this.id, this.email, this.displayName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      displayName: json["displayName"],
    );
  }
}
