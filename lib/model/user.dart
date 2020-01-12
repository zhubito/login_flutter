class User {
  final String email;
  final String pass;

  User({this.email, this.pass});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      pass: json['pass']
    );
  }
}