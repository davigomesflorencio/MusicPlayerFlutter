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
      backgroundColor: Pallete.background,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: _size.height * 0.32,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0)),
                color: Pallete.backgroundDetails,
                boxShadow: [
                  BoxShadow(
                    color: Pallete.backgroundDetailsDark,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            left: 0,
            child: AppBar(
              title: const Text(
                "Now Playing",
                style: TextStyleMusic.kPrimaryBoldTextStyle,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.queue_music,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: _size.height * 0.15,
            right: 0,
            left: 0,
            child: Column(
              children: <Widget>[
                widget.mp3model.albumImage != null
                    ? Container(
                        height: _size.height * 0.35,
                        width: _size.height * 0.35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              File(widget.mp3model.albumImage),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: _size.height * 0.35,
                        width: _size.height * 0.35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: ExactAssetImage("assets/images/sound.jpg"),
                            fit: BoxFit.cover,
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
                        widget.mp3model.displayName,
                        textAlign: TextAlign.center,
                        style: TextStyleMusic.kSecondaryBoldTextStyle,
                      ),
                      Text(
                        widget.mp3model.artist,
                        textAlign: TextAlign.center,
                        style: TextStyleMusic.kSecondaryTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ControlsAudio(
                      player: player, audioPath: widget.mp3model.path),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
