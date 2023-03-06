import 'package:music_player/src/data/models/music_model.dart';

class ListMusicModel {
  List<MusicModel> playlist = List<MusicModel>.empty();

  ListMusicModel({this.playlist});

  addModel(MusicModel model) {
    playlist.add(model);
  }
}
