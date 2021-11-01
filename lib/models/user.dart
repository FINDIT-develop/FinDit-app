class User {
  User({
    this.id,
  });

  int? id;
  //String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['result']["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        //"token": token,
      };
}
