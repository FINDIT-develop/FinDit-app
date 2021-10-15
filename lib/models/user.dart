class User {
  User({
    required this.email,
    required this.password,
    required this.passwordCheck,
    required this.name,
    required this.phone,
  });

  String email;
  String password;
  String passwordCheck;
  String name;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        passwordCheck: json["password_check"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "password_check": passwordCheck,
        "name": name,
        "phone": phone,
      };
}
