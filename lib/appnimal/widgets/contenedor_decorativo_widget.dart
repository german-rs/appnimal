import 'package:flutter/material.dart';
import '../constant/color.dart';

class ContenedorDecorativoWidget extends StatelessWidget {
  final double bottom;
  final double left;
  final double width;
  final double height;

  const ContenedorDecorativoWidget({
    super.key,
    required this.bottom,
    required this.left,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.colorFondoContenedorDecorativo,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
