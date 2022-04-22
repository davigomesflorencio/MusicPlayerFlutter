import 'package:flutter/material.dart';
import 'package:music_player/src/utils/pallete.dart';
import 'package:music_player/src/views/list_audio/list_audio.view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicPlayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Pallete.materialColor, //here is where the error resides
      ),
      initialRoute: '/list',
      routes: {
        '/list': (context) => const ListAudio(),
      },
    );
  }
}
