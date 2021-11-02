class User {
  User({this.id, this.email, this.name, this.password});

  int? id;
  String? email;
  String? name;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], email: json["email"], name: json["name"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "email": email, "name": name, "password": password};
}
