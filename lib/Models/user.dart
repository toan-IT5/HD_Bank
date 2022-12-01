// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String username;
  String password;
  String? fullname;
  String? email;
  String? phone;
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
}
