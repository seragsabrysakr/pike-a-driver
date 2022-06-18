// ignore_for_file: must_be_immutable

import '../../../../../../shared/resurces.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';

class CustomText extends StatelessWidget {
  final String data;
  String? family;
  double? size;
  FontWeight? weight;
  Color? color;

  TextDecoration? decoration;
  CustomText(
      {required this.data,
      this.color = MyColors.primarColor,
      this.weight,
      this.family=Resurces.mainfont,
      this.decoration = TextDecoration.none,
      this.size,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontFamily: family,
          decoration: decoration,
          fontSize: size,
          fontWeight: weight,
          color: color),
    );
  }
}
