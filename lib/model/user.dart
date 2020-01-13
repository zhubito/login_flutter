class User {
  final String id;
  final String email;
  final String pass;

  User({this.id, this.email, this.pass});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      pass: json['pass']
    );
  }
}