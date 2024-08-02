import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/circle_avatars.dart';
import 'package:office_dynasty/widgets/circle_image.dart';

class ImagePicker extends StatefulWidget {
  final double circleSize;
  final ValueChanged<ImageProvider> onImageChoose;
  final ImageProvider selectedImage;

  const ImagePicker({
    Key? key,
    required this.circleSize,
    required this.onImageChoose,
    required this.selectedImage,
  }) : super(key: key);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  ImageProvider? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.selectedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: materialImages.sublist(0, 4).map((image) {
            return Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: CircleImage(
                image: image,
                circleSize: widget.circleSize,
                isSelected: _selectedImage == image,
                onImageChoose: (chosenImage) {
                  setState(() {
                    _selectedImage = chosenImage;
                  });
                  widget.onImageChoose(chosenImage);
                },
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: materialImages.sublist(4).map((image) {
            return Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: CircleImage(
                image: image,
                circleSize: widget.circleSize,
                isSelected: _selectedImage == image,
                onImageChoose: (chosenImage) {
                  setState(() {
                    _selectedImage = chosenImage;
                  });
                  widget.onImageChoose(chosenImage);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
