import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/circle_colors.dart';
import 'package:office_dynasty/widgets/circle_color.dart';

class ColorPicker extends StatefulWidget {
  final double circleSize;
  final ValueChanged<Color> onColorChoose;
  final Color selectedColor;

  const ColorPicker({
    Key? key,
    required this.circleSize,
    required this.onColorChoose,
    required this.selectedColor,
  }) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: materialColors.sublist(0, 6).map((color) {
            return Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: CircleColor(
                color: color,
                circleSize: widget.circleSize,
                isSelected: _selectedColor == color,
                onColorChoose: (chosenColor) {
                  setState(() {
                    _selectedColor = chosenColor;
                  });
                  widget.onColorChoose(chosenColor);
                },
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: materialColors.sublist(6).map((color) {
            return Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: CircleColor(
                color: color,
                circleSize: widget.circleSize,
                isSelected: _selectedColor == color,
                onColorChoose: (chosenColor) {
                  setState(() {
                    _selectedColor = chosenColor;
                  });
                  widget.onColorChoose(chosenColor);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
