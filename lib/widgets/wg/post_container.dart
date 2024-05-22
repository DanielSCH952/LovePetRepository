import 'package:flutter/material.dart';
import 'package:lovepet/widgets/wg/post_header.dart';
import 'package:lovepet/widgets/wg/post_stats.dart';

class PostContainer extends StatelessWidget {
  final String? imageUrl;
  final String description;

  const PostContainer({super.key, this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
                if (imageUrl != null)
                  Image.asset(
                    imageUrl!,
                    fit: BoxFit.fitWidth,
                  )
                else
                  const SizedBox(height: 6.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PostStats(),
          ),
        ],
      ),
    );
  }
}
