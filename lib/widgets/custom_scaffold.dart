import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showFloatingActionButton;
  final Widget? leading;
  final VoidCallback? floatingActionButtonTap;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.showFloatingActionButton,
    this.leading,
    this.floatingActionButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return showFloatingActionButton
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: colorBackground,
            floatingActionButton: FloatingActionButton(
              backgroundColor: colorFloatingActionButton,
              onPressed: floatingActionButtonTap,
              child: const ImageIcon(
                size: 128.0,
                AssetImage(
                  'assets/icons/plus.png',
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: colorBackground,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              leading: leading,
              elevation: 0,
            ),
            body: body,
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: colorBackground,
            appBar: AppBar(
              backgroundColor: colorBackground,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              leading: leading,
              elevation: 0,
            ),
            body: body,
          );
  }
}
