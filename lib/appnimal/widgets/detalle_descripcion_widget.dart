import 'package:flutter/material.dart';

class DetalleDescripcionWidget extends StatelessWidget {
  final String descripcion;

  const DetalleDescripcionWidget({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Text(
      descripcion,
      style: const TextStyle(fontSize: 16, color: Colors.white70),
      textAlign: TextAlign.justify, // Alineación justificada para el texto.
    );
  }
}
