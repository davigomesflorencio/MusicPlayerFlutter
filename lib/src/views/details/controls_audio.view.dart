import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/utils/pallete.dart';

class ControlsAudio extends StatefulWidget {
  final AudioPlayer player;
  final String audioPath;

  const ControlsAudio({Key? key, required this.player, required this.audioPath})
      : super(key: key);

  @override
  State<ControlsAudio> createState() => _ControlsAudioState();
}

class _ControlsAudioState extends State<ControlsAudio> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Pallete.backgroundDetails;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void dispose() {
    super.dispose();
    widget.player.stop();
  }

  @override
  void initState() {
    super.initState();
    widget.player.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    widget.player.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    // widget.player.setUrl(widget.audioPath);
    widget.player.onPlayerCompletion.listen((event) {
      setState(() {
        _position = const Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? Icon(_icons[0], size: 50, color: color)
          : Icon(_icons[1], size: 50, color: Colors.white),
      onPressed: () {
        if (isPlaying == false) {
          widget.player.play(widget.audioPath, isLocal: true);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          widget.player.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget btnFast() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/forward.png'),
        size: 15,
        color: Colors.white,
      ),
      onPressed: () {
        widget.player.setPlaybackRate(1.5);
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/backword.png'),
        size: 15,
        color: Colors.white,
      ),
      onPressed: () {
        widget.player.setPlaybackRate(0.5);
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/loop.png'),
        size: 15,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: const ImageIcon(
        AssetImage('assets/images/repeat.png'),
        size: 15,
        color: Colors.white,
      ),
      onPressed: () {
        if (isRepeat == false) {
          widget.player.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat = true;
            color = Colors.black;
          });
        } else if (isRepeat == true) {
          widget.player.setReleaseMode(ReleaseMode.RELEASE);
          color = Colors.pink;
          isRepeat = false;
        }
      },
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        thumbColor: color,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.player.seek(newDuration);
  }

  Widget loadAsset() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString().split(".")[0],
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                _duration.toString().split(".")[0],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        slider(),
        loadAsset(),
      ],
    );
  }
}
