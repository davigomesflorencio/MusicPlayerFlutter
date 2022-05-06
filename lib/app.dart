import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:music_player/src/core/values/pallete.dart';
import 'package:music_player/src/modules/bindings/playlist.binding.dart';
import 'package:music_player/src/modules/playlist/playlist.view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MusicPlayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Pallete.materialColor,
        //here is where the error resides
      ),
      defaultTransition: Transition.native,
      locale: const Locale('pt', 'BR'),
      initialRoute: '/list',
      getPages: [
        GetPage(
          name: '/list',
          page: () => const Playlist(),
          binding: PlaylistBind(),
        ),
      ],
    );
  }
}
