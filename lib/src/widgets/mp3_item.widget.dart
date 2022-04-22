import 'package:flutter/material.dart';
import 'package:music_player/src/models/mp3_model.dart';
import 'package:music_player/src/utils/helpers.dart';
import 'package:music_player/src/views/details/details_audio.view.dart';

class Mp3Item extends StatelessWidget {
  final Mp3Model mp3File;

  const Mp3Item({Key? key, required this.mp3File}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: Image.memory(
        //   base64Decode(mp3File.albumImage),
        //   width: 100,
        //   fit: BoxFit.scaleDown,
        // ),
        title: Text(
          mp3File.displayName,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          mp3File.path,
          style: const TextStyle(fontSize: 16.0),
        ),
        minLeadingWidth: 0,
        trailing: SizedBox(
          height: double.infinity,
          child: Builder(
            builder: (ctx) => InkWell(
              child: const Icon(
                Icons.play_circle,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsAudio(mp3model: mp3File),
                  ),
                );
                Helpers.showSnack(ctx, mp3File.path);
              },
            ),
          ),
        ),
      ),
    );
  }
}
