import 'package:flutter/material.dart';

class DetalleImagenWidget extends StatelessWidget {
  final String imagePath;

  const DetalleImagenWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Bordes redondeados.
      child: Image.asset(
        imagePath,
        width: 300, // Ancho de la imagen.
        fit: BoxFit
            .fitWidth, // Ajusta la altura automáticamente manteniendo la proporción.
      ),
    );
  }
}
