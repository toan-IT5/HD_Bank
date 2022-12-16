import 'dart:convert';

class TransferHistory {
  String transDesc;
  String transDate;
  double transAmount;
  TransferHistory({
    required this.transDesc,
    required this.transDate,
    required this.transAmount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transDesc': transDesc,
      'transDate': transDate,
      'transAmount': transAmount,
    };
  }

  factory TransferHistory.fromMap(Map<String, dynamic> map) {
    return TransferHistory(
      transDesc: map['transDesc'] as String,
      transDate: map['transDate'] as String,
      transAmount: double.parse(map['transAmount']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransferHistory.fromJson(String source) =>
      TransferHistory.fromMap(json.decode(source) as Map<String, dynamic>);
}
