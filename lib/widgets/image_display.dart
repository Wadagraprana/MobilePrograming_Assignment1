import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final String imagePath;

  const ImageDisplay({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Container(
        key: ValueKey<String>(imagePath),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent, width: 5)),
        child: Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
      ),
    );
  }
}
