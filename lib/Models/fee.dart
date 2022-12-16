import 'dart:convert';

class Fee {
  String fee;
  String description;
  Fee({
    required this.fee,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fee': fee,
      'description': description,
    };
  }

  factory Fee.fromMap(Map<String, dynamic> map) {
    return Fee(
      fee: map['fee'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fee.fromJson(String source) =>
      Fee.fromMap(json.decode(source) as Map<String, dynamic>);
}
