import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'audio_player_widget.dart';
import '../screens/detalle_screen.dart'; // Asegúrate de que este archivo esté en la carpeta correcta.

class ItemWidget extends StatelessWidget {
  final ItemModel item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleScreen(
              title: item.title,
              imagePath: item.detailImage,
              description: item.description,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 10.0), // Espacio vertical entre las imágenes.
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Bordes redondeados.
              child:
                  Image.asset(item.imagePath), // Alternar entre las imágenes.
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: AudioPlayerWidget(
                rutaAudio: item.audioPath, // Botón de reproducción de audio.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
