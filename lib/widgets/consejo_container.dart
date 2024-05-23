import 'package:flutter/material.dart';
import 'package:lovepet/widgets/wg/consejo_container_header.dart';

class ConsejoContainer extends StatelessWidget {
  final String? imageUrl;
  final String description;

  const ConsejoContainer({Key? key, this.imageUrl, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double availableWidth = constraints.maxWidth;
          double imageWidth = availableWidth * 0.6;
          double imageHeight = imageWidth;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10.0),
                    ConsejoContainerHeader(),
                    if (imageUrl != null) ...[
                      Image.asset(
                        imageUrl!,
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                    Text(
                      description,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
