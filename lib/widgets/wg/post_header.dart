import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lovepet/widgets/wg/profile_avatar.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "nombre",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Ubicación",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
      ],
    );
  }
}
