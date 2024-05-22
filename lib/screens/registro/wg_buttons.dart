import 'package:flutter/material.dart';
import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/services/router.dart';

class WgButtonGroup extends StatelessWidget {
  const WgButtonGroup({
    super.key,
    required this.$currentIndx,
    required this.$textLeft,
    required this.$textRigth,
    this.$handleLefButton,
    this.$handleRigthButton,
  });
  final String $textRigth;
  final String $textLeft;
  final int $currentIndx;
  final void Function()? $handleLefButton;
  final void Function()? $handleRigthButton;
  @override
  Widget build(BuildContext context) {
    AnimateRouter _router = AnimateRouter();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: $handleLefButton,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            elevation: 5,
          ),
          child: Text(
            $textLeft,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        30.kW,
        ElevatedButton(
          onPressed: $handleRigthButton,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            elevation: 5,
          ),
          child: Text(
            $textRigth,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
