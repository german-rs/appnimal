import 'package:flutter/material.dart';

class EncabezadoWidget extends StatelessWidget {
  const EncabezadoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descubramos',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'juntos nuestro majestuoso mundo.',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
