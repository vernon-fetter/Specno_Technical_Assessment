import 'package:flutter/material.dart';

typedef OnImageChoose = void Function(ImageProvider image);

class CircleImage extends StatelessWidget {
  final bool isSelected;
  final ImageProvider image;
  final OnImageChoose? onImageChoose;
  final double circleSize;

  const CircleImage({
    Key? key,
    required this.image,
    required this.circleSize,
    this.onImageChoose,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImageChoose != null ? () => onImageChoose!(image) : null,
      child: Material(
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: isSelected ? Colors.grey : Colors.transparent,
          radius: circleSize / 2,
          child: CircleAvatar(
            backgroundImage: image,
            backgroundColor: Colors.transparent,
            radius: isSelected ? (circleSize / 2) - 4 : circleSize / 2,
          ),
        ),
      ),
    );
  }
}
