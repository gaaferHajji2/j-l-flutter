import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

class ListItem extends StatelessWidget {
  final AudioPlayer player;

  final String audioFile;

  final int red;

  final int green;

  final int blue;

  const ListItem({
    super.key,
    required this.player,
    required this.audioFile,
    required this.red,
    required this.green,
    required this.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(

        onTap: () async {
          await player.play(AssetSource(this.audioFile));
        },

        child: Container(
          width: double.infinity,
          color: Color.fromARGB(
            255,
            this.red,
            this.green,
            this.blue,
          ),
        ),
      ),
    );
  }
}
