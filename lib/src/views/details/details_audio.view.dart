import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/mp3_model.dart';
import 'package:music_player/src/utils/pallete.dart';
import 'package:music_player/src/utils/text_style.dart';
import 'package:music_player/src/views/details/controls_audio.view.dart';

class DetailsAudio extends StatefulWidget {
  final Mp3Model mp3model;
  const DetailsAudio({Key? key, required this.mp3model}) : super(key: key);

  @override
  State<DetailsAudio> createState() => _DetailsAudioState();
}

class _DetailsAudioState extends State<DetailsAudio> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.mp3model.displayName}",
          style: TextStyleMusic.kSecondaryBoldTextStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Pallete.audioBluishBackground,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: _size.height * 0.5,
              width: _size.width * 0.8,
              child: widget.mp3model.albumImage != null
                  ? Image.file(
                      File(widget.mp3model.albumImage),
                      fit: BoxFit.cover,
                    )
                  : const Image(
                      image: AssetImage("assets/images/sound.jpg"),
                      fit: BoxFit.cover,
                    ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    40,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                Text(
                  "${widget.mp3model.displayName}",
                  textAlign: TextAlign.center,
                  style: TextStyleMusic.kSecondaryBoldTextStyle,
                ),
                Text(
                  "${widget.mp3model.artist}",
                  textAlign: TextAlign.center,
                  style: TextStyleMusic.kSecondaryTextStyle,
                ),
              ],
            ),
          ),
          Column(children: <Widget>[
            ControlsAudio(player: player, audioPath: widget.mp3model.path),
          ]),
        ],
      ),
    );
  }
}
