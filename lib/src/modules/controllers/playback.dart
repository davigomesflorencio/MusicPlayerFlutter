import 'package:get/get.dart';
import 'package:music_player/src/data/models/list_music_model.dart';
import 'package:music_player/src/data/models/music_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaybackController extends GetxController {
  final Rx<ListMusicModel> musics =
      ListMusicModel(playlist: RxList<MusicModel>.empty(growable: true)).obs;
  late List<SongModel> songs;

  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  void onInit() {
    serchSongs();
    super.onInit();
  }

  serchSongs() async {
    songs = await _audioQuery.querySongs();
    for (var song in songs) {
      var model = MusicModel(
        album: song.album ?? "",
        albumImage: song.album ?? "",
        displayName: song.displayName,
        duration: song.duration.toString(),
        path: song.uri!,
        artist: song.artist!,
        dateAdded: song.dateAdded.toString(),
        size: song.size.toString(),
      );
      if (model.path.contains(".mp3") == true &&
          model.path.contains("O SEU") == false &&
          model.path.contains("/storage/emulated/0/Music/") == false) {
        musics.value.addModel(model);
      }
    }
  }
}
