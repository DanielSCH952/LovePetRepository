import 'dart:io';

import 'package:flutter/material.dart';

class WgCardImage extends StatelessWidget {
  final double widthItem;
  final double heightItem;
  final EdgeInsets margen;
  final EdgeInsets padding;
  final File image;
  final VoidCallback changeImage;
  final VoidCallback cropImage;
  const WgCardImage({
    super.key,
    this.widthItem = 294.75,
    this.heightItem = 294.75,
    this.margen = const EdgeInsets.all(5.5),
    this.padding = const EdgeInsets.all(5.2),
    
    required this.image,
    required this.changeImage,
    required this.cropImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widthItem,
      height: heightItem,
      margin: margen,
      padding:padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Wrap(
              spacing: 8.75,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.5),
                      color: const Color.fromARGB(200, 255, 255, 255)),
                  height: 40,
                  width: 45,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: changeImage,
                    icon: const Icon(
                      Icons.change_circle,
                      size: 37,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.5),
                      color: const Color.fromARGB(200, 255, 255, 255)),
                  height: 40,
                  width: 44,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: cropImage,
                    icon: const Icon(
                      Icons.crop_outlined,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
