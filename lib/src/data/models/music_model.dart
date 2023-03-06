class MusicModel {
  final String path;
  final String displayName;
  final String album;
  final String albumImage;
  final String artist;
  final String dateAdded;
  final String size;
  final String duration;

  MusicModel({
    this.path,
    this.displayName,
    this.album,
    this.albumImage,
    this.artist,
    this.dateAdded,
    this.size,
    this.duration,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        path: json["path"],
        // displayName: json["displayName"],
        displayName: "",
        // album: json["album"],
        album: "",
        // albumImage: json["albumImage"],
        albumImage: "",
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
