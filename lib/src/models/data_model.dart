import 'package:music_player/src/models/mp3_model.dart';

class DataMp3Model {
  late List<Mp3Model>? mp3Files;

  DataMp3Model({this.mp3Files}) {
    mp3Files = List<Mp3Model>.empty(growable: true);
  }

  DataMp3Model.fromJson(Map<String, dynamic> json) {
    if (json["Mp3Files"] != null) {
      json['Mp3Files'].forEach((v) {
        mp3Files?.add(Mp3Model.fromJson(v));
      });
    }
  }
  addModel(Mp3Model model) {
    mp3Files?.add(model);
  }
}
