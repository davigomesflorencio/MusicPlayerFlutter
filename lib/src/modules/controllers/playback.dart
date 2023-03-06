import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';
import 'package:music_player/src/data/models/list_music_model.dart';
import 'package:music_player/src/data/models/music_model.dart';

class PlaybackController extends GetxController {
  final Rx<ListMusicModel> musics =
      ListMusicModel(playlist: RxList<MusicModel>.empty(growable: true)).obs;
  List<SongInfo> songs;

  final FlutterAudioQuery _audioQuery = FlutterAudioQuery();

  @override
  void onInit() {
    serchSongs();
    super.onInit();
  }

  serchSongs() async {
    songs = await _audioQuery.getSongs();
    for (var song in songs) {
      var model = MusicModel(
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
          model.path.contains("O SEU") == false &&
          model.path.contains("/storage/emulated/0/Music/") == false) {
        musics.value.addModel(model);
      }
    }
  }
}
