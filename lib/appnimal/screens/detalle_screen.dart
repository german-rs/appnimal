import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/detalle_imagen_widget.dart';
import '../widgets/detalle_descripcion_widget.dart';

class DetalleScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const DetalleScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        mostrarIconoRetroceso: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            DetalleImagenWidget(imagePath: imagePath),
            const SizedBox(height: 20),
            DetalleDescripcionWidget(descripcion: description),
          ],
        ),
      ),
    );
  }
}
