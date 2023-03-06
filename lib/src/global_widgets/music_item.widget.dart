import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/src/data/models/music_model.dart';
import 'package:music_player/src/modules/details/details.view.dart';

class MusicItem extends StatelessWidget {
  final MusicModel mp3File;

  const MusicItem({key, this.mp3File}) : super(key: key);

  String formatTime(String s) {
    int seconds = (int.parse(s) / 1000).floor();
    Duration duration = Duration(seconds: seconds);
    String parsedTime = duration.toString().split(".")[0];
    return parsedTime;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(DetailsAudio(mp3model: mp3File));
        // Get.snackbar("Path", mp3File.path);
      },
      leading: const Icon(
        Icons.volume_up,
        color: Colors.orange,
      ),
      title: Text(
        mp3File.displayName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        mp3File.artist == null
            ? "Uknown"
            : "${mp3File.artist} - ${formatTime(mp3File.duration)}",
        style: const TextStyle(
          fontSize: 10.0,
          color: Colors.grey,
        ),
      ),
      minLeadingWidth: 0,
      trailing: SizedBox(
        height: double.infinity,
        child: Builder(
          builder: (ctx) => InkWell(
            child: const Icon(
              Icons.favorite,
              size: 30,
              color: Color(0xFF38adaf),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
