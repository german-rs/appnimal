import 'package:flutter/material.dart';
import '../constants/color.dart';

class BotonReproduccionPausa extends StatelessWidget {
  final bool enReproduccion;
  final VoidCallback alPresionar;

  const BotonReproduccionPausa(
      {super.key, required this.enReproduccion, required this.alPresionar});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.circle, color: AppColors.colorBoton, size: 80),
          Icon(enReproduccion ? Icons.pause : Icons.play_arrow,
              color: Colors.white, size: 40),
        ],
      ),
      onPressed: alPresionar,
    );
  }
}
