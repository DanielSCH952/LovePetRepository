import 'package:flutter/material.dart';

class PostStats extends StatefulWidget {
  final VoidCallback onCommentPressed;
  final VoidCallback onCommentsCountPressed;

  const PostStats({
    Key? key,
    required this.onCommentPressed,
    required this.onCommentsCountPressed,
  }) : super(key: key);

  @override
  _PostStatsState createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                      color: isLiked ? Colors.red : Colors.black,
                    ),
                    onPressed: toggleLike,
                  ),
                ),
                const SizedBox(width: 4.0),
                Text(
                  "no. likes",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.mode_comment_outlined),
                    color: Colors.black,
                    onPressed: widget.onCommentPressed,
                  ),
                ),
                const SizedBox(width: 4.0),
                GestureDetector(
                  onTap: widget.onCommentsCountPressed,
                  child: Text(
                    "no. comentarios",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Fecha y hora",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
