import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .007,
      width: MediaQuery.of(context).size.height * .14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
