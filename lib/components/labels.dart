import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';

class LabelsTitle extends StatelessWidget {
  const LabelsTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Text(
        text,
        style:const  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
