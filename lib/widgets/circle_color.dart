import 'package:flutter/material.dart';

typedef OnColorChoose = void Function(Color color);

class CircleColor extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final OnColorChoose? onColorChoose;
  final double circleSize;

  const CircleColor({
    Key? key,
    required this.color,
    required this.circleSize,
    this.onColorChoose,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onColorChoose != null ? () => onColorChoose!(color) : null,
      child: Material(
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: isSelected ? Colors.grey : Colors.transparent,
          radius: circleSize / 2,
          child: CircleAvatar(
            backgroundColor: color,
            radius: isSelected ? (circleSize / 2) - 4 : circleSize / 2,
          ),
        ),
      ),
    );
  }
}
