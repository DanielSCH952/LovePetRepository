import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget? leading;

  CustomCard({
    required this.title,
    required this.onPressed,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // La imagen
          leading != null ? leading! : Container(),
          // El título
          ListTile(
            title: Text(title),
            onTap: onPressed,
          ),
        ],
      ),
    );
  }
}
