import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/src/core/values/pallete.dart';
import 'package:music_player/src/core/values/text.style.dart';
import 'package:music_player/src/data/models/list_music_model.dart';
import 'package:music_player/src/global_widgets/bottom_nav_bar.widget.dart';
import 'package:music_player/src/global_widgets/music_item.widget.dart';
import 'package:music_player/src/modules/controllers/playback_controller.dart';

class Playlist extends StatefulWidget {
  const Playlist({key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  PlaybackController controller = Get.find();
  @override
  void initState() {
    controller.serchSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Seja bem vindo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Pallete.background,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.queue_music,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Container(
        color: Pallete.background,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45,
                      width: size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.serchSongs();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Pallete.bt,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Text(
                              "Play",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Pallete.bt,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.shuffle,
                              color: Colors.black,
                            ),
                            Text(
                              "Shuffle",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  ListMusicModel musics = controller.musics.value;
                  if (musics.playlist.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return _buildPlaylist(musics);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  ListView _buildPlaylist(ListMusicModel musics) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: musics.playlist.length,
      itemBuilder: (context, index) {
        return MusicItem(mp3File: musics.playlist[index]);
      },
    );
  }
}
