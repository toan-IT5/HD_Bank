import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transfer {
  String amount;
  String descrition;
  String fromAcct;
  String toAcct;
  Transfer({
    required this.amount,
    required this.descrition,
    required this.fromAcct,
    required this.toAcct,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'description': descrition,
      'fromAcct': fromAcct,
      'toAcct': toAcct,
    };
  }

  factory Transfer.fromMap(Map<String, dynamic> map) {
    return Transfer(
      amount: map['amount'] as String,
      descrition: map['descrition'] as String,
      fromAcct: map['fromAcct'] as String,
      toAcct: map['toAcct'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transfer.fromJson(String source) =>
      Transfer.fromMap(json.decode(source) as Map<String, dynamic>);
}
