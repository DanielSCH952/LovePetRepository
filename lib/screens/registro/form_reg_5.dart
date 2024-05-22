import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/widgets/personal_widgets/card_image.dart';
import 'package:lovepet/widgets/personal_widgets/picker_image.dart';

class WgFormView5 extends StatelessWidget {
  const WgFormView5({
    super.key,
    this.imagen,
    this.$handlePickImageCamara,
    this.$handlePickImageGalery,
    this.$handleCropImage,
    this.$handleUpdateImage,
  });
  final File? imagen;
  final void Function()? $handlePickImageGalery;
  final void Function()? $handlePickImageCamara;
  final void Function()? $handleUpdateImage;
  final void Function()? $handleCropImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: imagen != null
                ? WgCardImage(
                    image: imagen!,
                    changeImage: $handleCropImage,
                    cropImage: $handleUpdateImage,
                  )
                : WgPickerImage(
                    showImageIcon: true,
                    captureImgCamera: $handlePickImageCamara,
                    captureImgGalery: $handlePickImageGalery,
                  ),
          ),
        ),
      ),
    );
  }
}
