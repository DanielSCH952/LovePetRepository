import 'dart:math';

import 'package:flutter/material.dart';

class WgCustomToast extends StatelessWidget {
  const WgCustomToast({
    super.key,
    required this.msg,
    required this.icon,
    this.randomColor = true,
  });

  final String msg;
  final Widget icon;
  final bool randomColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: randomColor
              ? _randomColor()
              : Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          //icon
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.add_moderator,
              color: randomColor
                  ? _randomColor()
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          //msg
          Text(msg, style: const TextStyle(color: Colors.white)),
        ]),
      ),
    );
  }

  Color _randomColor() {
    return Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );
  }
}
