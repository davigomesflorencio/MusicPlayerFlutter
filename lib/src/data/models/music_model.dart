import 'dart:typed_data';

class MusicModel {
  final String path;
  final String displayName;
  final String album;
  final Uint8List? albumImage;
  final String artist;
  final String dateAdded;
  final String size;
  final String duration;

  MusicModel({
    required this.path,
    required this.displayName,
    required this.album,
    required this.albumImage,
    required this.artist,
    required this.dateAdded,
    required this.size,
    required this.duration,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        path: json["path"],
        // displayName: json["displayName"],
        displayName: "",
        // album: json["album"],
        album: "",
        // albumImage: json["albumImage"],
        albumImage: null,
        // artist: json["artist"],
        artist: "",
        // dateAdded: json["dateAdded"],
        dateAdded: "",
        size: json["size"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "displayName": displayName,
        "album": album,
        "shortName": albumImage,
        "artist": artist,
        "dateAdded": dateAdded,
        "size": size,
        "duration": duration,
      };
}
