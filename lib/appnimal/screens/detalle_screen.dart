import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_widget.dart'; // Importa el CustomAppBar.
import '../widgets/detalle_imagen_widget.dart'; // Importa el widget de la imagen.
import '../widgets/detalle_descripcion_widget.dart'; // Importa el widget de la descripción.

class DetalleScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const DetalleScreen(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: title,
        mostrarIconoRetroceso: true, // Muestra el ícono de retroceso.
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Añadir padding alrededor del contenido.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            DetalleImagenWidget(
                imagePath: imagePath), // Utiliza el widget de la imagen.
            const SizedBox(height: 20),
            DetalleDescripcionWidget(
                descripcion:
                    description), // Utiliza el widget de la descripción.
          ],
        ),
      ),
    );
  }
}
