import 'package:flutter/material.dart';

extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get kH => SizedBox(
        height: this?.toDouble(),
        // child: Container(
        //   color: Color.fromARGB(175, 188, 187, 187),
        // ),
      );
  Widget get kW => SizedBox(
        width: this?.toDouble(),
      );
}
