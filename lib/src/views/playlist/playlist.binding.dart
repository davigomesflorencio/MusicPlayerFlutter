import 'package:get/get.dart';
import 'package:music_player/src/controllers/playback.dart';

class PlaylistBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaybackController>(() {
      return PlaybackController();
    });
  }
}
