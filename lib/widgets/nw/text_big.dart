import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';

class TextBig extends StatelessWidget {
  final String text;
  const TextBig({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, color: kPrimaryColor, fontWeight: FontWeight.bold),
    );
  }
}
