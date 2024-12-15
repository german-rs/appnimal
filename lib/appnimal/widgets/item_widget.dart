import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'audio_player_widget.dart';
import '../screens/detalle_screen.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: AudioPlayerWidget(
                  rutaAudio: item.audioPath,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
