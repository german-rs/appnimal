import 'package:flutter/material.dart';

class DetalleDescripcionWidget extends StatelessWidget {
  final String descripcion;

  const DetalleDescripcionWidget({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Text(
      descripcion,
      style: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.white),
      textAlign: TextAlign.justify,
    );
  }
}
