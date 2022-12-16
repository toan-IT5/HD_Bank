import 'dart:convert';

class Account {
  String name;
  String accountNo;
  String image;
  Account({
    required this.name,
    required this.accountNo,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'accountNo': accountNo,
      'image': image,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      name: map['name'] as String,
      accountNo: map['accountNo'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);
}
