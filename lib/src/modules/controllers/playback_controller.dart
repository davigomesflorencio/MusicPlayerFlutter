import 'dart:io';
import 'dart:typed_data';

import 'package:aura_music_kit/aura_music_kit.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:music_player/src/data/models/list_music_model.dart';
import 'package:music_player/src/data/models/music_model.dart';
// import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlaybackController extends GetxController {
  final Rx<ListMusicModel> musics =
      ListMusicModel(playlist: RxList<MusicModel>.empty(growable: true)).obs;

  List<Song> songs = [];

  @override
  void onInit() {
    serchSongs();
    super.onInit();
  }

  serchSongs() async {
    if (!(await _getPermission()).isGranted) {
      await _requestPermission();
    } else {
      await _fetchMusic();
    }
  }

  Future<PermissionStatus> _getPermission() async {
    if (Platform.isAndroid) {
      final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
      return sdkInt >= 33 ? Permission.audio.status : Permission.storage.status;
    }
    return Permission.mediaLibrary.status;
  }

  Future<void> _requestPermission() async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
      status = sdkInt >= 33
          ? await Permission.audio.request()
          : await Permission.storage.request();
    } else {
      status = await Permission.mediaLibrary.request();
    }

    if (status.isGranted) {
      _fetchMusic();
    } else {
      // Handle denial
    }
  }

  Future<void> _fetchMusic() async {
    if (!(await _getPermission()).isGranted) return;
    final fetchedSongs = await AuraMusicKit.getMusicFiles();
    songs = fetchedSongs;
    for (var song in songs) {
      var model = MusicModel(
        album: "",
        albumImage: song.artwork ?? Uint8List(0),
        displayName: song.title,
        duration: song.duration.toString(),
        path: song.path!,
        artist: song.artist!,
        dateAdded: "",
        size: "",
      );
      musics.value.addModel(model);
    }
  }
}
