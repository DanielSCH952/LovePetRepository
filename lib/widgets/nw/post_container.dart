import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';
import 'package:lovepet/widgets/nw/comment_container.dart';
import 'package:lovepet/widgets/wg/post_header.dart';
import 'package:lovepet/widgets/wg/post_stats.dart';

class PostContainer extends StatefulWidget {
  final String? imageUrl;
  final String description;
  final List<Map<String, String>> comments;

  const PostContainer({
    Key? key,
    this.imageUrl,
    required this.description,
    required this.comments,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  bool showComments = false;

  void toggleComments() {
    setState(() {
      showComments = !showComments;
    });
  }

  void showAddCommentDialog() {
    TextEditingController commentController = TextEditingController();
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      body: Column(
        children: [
          Text(
            'Agregar comentario',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(right: 30, left: 30),
            height: 200,
            child: TextField(
              controller: commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Escribe tu comentario...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      btnCancelText: 'Cancelar',
      btnCancelOnPress: () {},
      btnOkText: 'Comentar',
      btnOkOnPress: () {
        setState(() {
          widget.comments.add({
            'avatarImagePath': 'assets/raccoon.png',
            'username': 'Nuevo Usuario',
            'commentText': commentController.text,
          });
        });
      },
    ).show();
  }

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
                  widget.description,
                  style: TextStyle(fontSize: 16),
                ),
                if (widget.imageUrl != null)
                  Image.asset(
                    widget.imageUrl!,
                    fit: BoxFit.fitWidth,
                  )
                else
                  const SizedBox(height: 6.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                // PostStats(
                //   onCommentPressed: showAddCommentDialog,
                //   onCommentsCountPressed: toggleComments,
                // ),
                const PostStats(),
                if (showComments)
                  for (var comment in widget.comments)
                    Comment(
                      avatarImagePath: comment['avatarImagePath']!,
                      username: comment['username']!,
                      commentText: comment['commentText']!,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
