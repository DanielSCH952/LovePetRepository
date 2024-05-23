import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';

class TextMedian extends StatelessWidget {
  final String text;
  const TextMedian({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: kPrimaryColor, fontWeight: FontWeight.bold),
    );
  }
}