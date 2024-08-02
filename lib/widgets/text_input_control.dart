import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';

class TextInputControl extends StatefulWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String> onChange;
  final ValueChanged<bool>? onFocusChanged;
  final bool? enabled;
  final TextInputType? keyboardType;
  final int? maxLines;

  const TextInputControl({
    super.key,
    this.placeholder,
    this.controller,
    required this.onChange,
    this.onFocusChanged,
    this.enabled,
    this.keyboardType,
    this.maxLines,
  });

  @override
  _TextInputControlState createState() => _TextInputControlState();
}

class _TextInputControlState extends State<TextInputControl> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      init();
    });
    super.initState();
  }

  init() {
    _focus.addListener(_onFocusChange);
    if (widget.controller == null) {
      _controller.addListener(_onTextChange);
    } else {
      widget.controller!.addListener(_onTextChange);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _focus.removeListener(_onFocusChange);
    if (widget.controller == null) {
      _controller.removeListener(_onTextChange);
    } else {
      widget.controller!.removeListener(_onTextChange);
    }
  }

  _onTextChange() {
    if (widget.controller == null) {
      widget.onChange(_controller.text);
    } else {
      widget.onChange(widget.controller!.text);
    }
  }

  _onFocusChange() {
    if (widget.onFocusChanged != null) {
      widget.onFocusChanged!(_focus.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
      controller: widget.controller ?? _controller,
      focusNode: _focus,
      style: const TextStyle(
        color: colorFontLight,
        fontSize: 16.0,
      ),
      enabled: widget.enabled,
      decoration: InputDecoration(
        filled: true,
        fillColor: colorExpansionTile,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        labelText: widget.placeholder,
        labelStyle: const TextStyle(
          color: colorFontLight,
          fontSize: 16.0,
        ),
        contentPadding: const EdgeInsets.all(
          3.0,
        ),
        counterText: "",
      ),
    );
  }
}
