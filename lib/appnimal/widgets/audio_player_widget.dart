import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'boton_reproduccion_widget.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String rutaAudio;

  const AudioPlayerWidget({super.key, required this.rutaAudio});

  @override
  // ignore: library_private_types_in_public_api
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  bool _enReproduccion = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          _enReproduccion = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _alternarReproduccionPausa() async {
    try {
      if (_enReproduccion) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.setAsset(widget.rutaAudio);
        _audioPlayer.play();
      }
      setState(() {
        _enReproduccion = !_enReproduccion;
      });
    } catch (e) {
      debugPrint("Error al reproducir el audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BotonReproduccionPausa(
      enReproduccion: _enReproduccion,
      alPresionar: _alternarReproduccionPausa,
    );
  }
}
