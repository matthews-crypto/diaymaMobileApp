import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;

  const AudioPlayerWidget({Key? key, required this.audioPath})
      : super(key: key);
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _loadAndPlayAudio();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _loadAndPlayAudio() async {
    try {
      await _player.setUrl(widget.audioPath);
      await _player.play();
    } catch (e) {
      print("Erreur lors du chargement de l'audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.pause),
      onPressed: () {
        _player.pause();
      },
    );
  }
}
