import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';

class TextSmoll extends StatelessWidget {
  final String text;
  const TextSmoll({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, color: kPrimaryColor),
    );
  }
}
