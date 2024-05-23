import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Comment extends StatelessWidget {
  final String avatarImagePath;
  final String username;
  final String commentText;

  Comment({
    required this.avatarImagePath,
    required this.username,
    required this.commentText,
  });

  void _showDeleteDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Eliminar",
      desc: "¿Desea eliminar este comentario?",
      btnCancelText: 'Cancelar',
      btnOkText: 'Eliminar',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarImagePath),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      commentText,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color: Colors.black, size: 30),
                onSelected: (String result) {
                  if (result == 'Eliminar') {
                    _showDeleteDialog(context);
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Eliminar',
                    child: Text('Eliminar'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
