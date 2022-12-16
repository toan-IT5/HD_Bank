import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hd_bank/Views/Widgets/custom_text_field.dart';

class Feature {
  String name;
  String image;
  double padding;
  Color bachgroundColor;
  double radius;
  EActionType type;
  Feature({
    required this.name,
    required this.image,
    this.padding = 12,
    this.bachgroundColor = Colors.white,
    this.radius = 27,
    this.type = EActionType.Default,
  });
}

// ignore: constant_identifier_names
enum EActionType { Tuition, Default }
