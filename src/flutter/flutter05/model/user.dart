class User {
  int? id;
  String username;
  String pass;
  DateTime? dateOfBirth;

  User({this.id,
    required this.username,
    required this.pass,
    DateTime? this.dateOfBirth});

  // chuyển đổi đối tượng note thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'pass': pass,
      'dateOfBirth' : dateOfBirth,
    };
  }

  // chuyển đổi đối tượng Map thành note
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      pass: map['pass'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}
