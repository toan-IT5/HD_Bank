import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feature {
  String name;
  String image;
  double padding;
  Color bachgroundColor;
  double radius;
  Feature({
    required this.name,
    required this.image,
    this.padding = 12,
    this.bachgroundColor = Colors.white,
    this.radius = 27,
  });
}
