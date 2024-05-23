import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ConsejoContainerHeader extends StatelessWidget {
  const ConsejoContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Titulo del consejo",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(CupertinoIcons.bookmark),
                color: kPrimaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
