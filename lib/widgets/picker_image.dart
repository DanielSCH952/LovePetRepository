import 'package:flutter/material.dart';

class WgPickerImage extends StatelessWidget {
  final bool showImageIcon;
  final Widget? imagenIcon;
  final String label;
  final VoidCallback? captureImgGalery;
  final VoidCallback? captureImgCamera;
  const WgPickerImage({
    super.key,
    this.showImageIcon = true,
    this.imagenIcon,
    this.label = "Seleccione una imagen",
    this.captureImgCamera,
    this.captureImgGalery,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (showImageIcon)
            ? imagenIcon ??
                Image.asset(
                  'assets/img-null.png',
                  height: 176,
                  width: 176,
                  fit: BoxFit.fill,
                  scale: 1,
                )
            : const SizedBox(
                height: 0,
              ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 25,
          children: [
            MaterialButton(
              minWidth: 60.3,
              color: const Color.fromARGB(214, 176, 198, 239),
              onPressed: captureImgGalery,
              child: const Icon(
                Icons.image_search,
                color: Colors.black38,
                size: 50,
              ),
            ),
            MaterialButton(
              minWidth: 60.3,
              color: const Color.fromARGB(214, 176, 198, 239),
              onPressed: captureImgCamera,
              child: const Icon(
                Icons.camera_outlined,
                color: Colors.black38,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
