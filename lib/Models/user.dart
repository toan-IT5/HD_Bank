import 'dart:convert';

class User {
  String username;
  String password;
  String? fullname = "Hồ Văn Toàn";
  String? email = "it.vantoan@gmail.com";
  String? phone = "0336516906";
  String identityNumber = "";

  User(this.username, this.password, {this.fullname, this.email, this.phone}) {
    identityNumber = idGenerator();
  }

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'identityNumber': identityNumber,
    };
  }

  Map<String, dynamic> toUserMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  String toJson() => json.encode(toUserMap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(map['username'] ?? "", map['password'] ?? "");
  }
  factory User.fromJson(String json) {
    return User.fromMap(jsonDecode(json));
  }
}
