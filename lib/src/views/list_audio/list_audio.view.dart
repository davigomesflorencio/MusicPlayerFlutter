import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/src/models/data_model.dart';
import 'package:music_player/src/models/mp3_model.dart';
import 'package:music_player/src/utils/pallete.dart';
import 'package:music_player/src/widgets/mp3_item.widget.dart';

class ListAudio extends StatefulWidget {
  const ListAudio({Key? key}) : super(key: key);

  @override
  State<ListAudio> createState() => _ListAudioState();
}

class _ListAudioState extends State<ListAudio> {
  final DataMp3Model _dataMp3Model = DataMp3Model();
  late List<SongInfo> songs;

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  Future<void> getMp3sData() async {
    songs = await audioQuery.getSongs();

    for (var song in songs) {
      var model = Mp3Model(
        album: song.album,
        albumImage: song.albumArtwork,
        displayName: song.displayName,
        duration: song.duration,
        path: song.filePath,
        artist: song.artist,
        dateAdded: song.year,
        size: song.fileSize,
      );
      if (model.path.contains(".mp3") == true &&
          model.path.contains("/storage/emulated/0/Music/") == false) {
        _dataMp3Model.addModel(model);

        print(song.filePath);
      }
    }

    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMp3sData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MusicPlayer"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _dataMp3Model.mp3Files == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _dataMp3Model.mp3Files?.length ?? 0,
              itemBuilder: (context, index) {
                return Mp3Item(mp3File: _dataMp3Model.mp3Files![index]);
              },
            ),
    );
  }
}
