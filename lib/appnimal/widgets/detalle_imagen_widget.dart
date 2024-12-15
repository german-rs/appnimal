import 'package:flutter/material.dart';

class DetalleImagenWidget extends StatelessWidget {
  final String imagePath;

  const DetalleImagenWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imagePath,
        width: 300,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
