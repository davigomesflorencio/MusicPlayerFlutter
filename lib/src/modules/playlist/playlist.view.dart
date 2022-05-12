import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/src/core/values/pallete.dart';
import 'package:music_player/src/core/values/text.style.dart';
import 'package:music_player/src/data/models/list_music_model.dart';
import 'package:music_player/src/global_widgets/bottom_nav_bar.widget.dart';
import 'package:music_player/src/global_widgets/music_item.widget.dart';
import 'package:music_player/src/modules/controllers/playback.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  PlaybackController controller = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MusicFlutter",
          style: TextStyleMusic.kPrimaryBoldTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
      backgroundColor: Pallete.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 45,
                    width: _size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.serchSongs();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          Text(
                            "Play",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: _size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.shuffle, color: Colors.white),
                          Text(
                            "Shuffle",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
