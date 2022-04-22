class Mp3Model {
  final String path;
  final String displayName;
  final String album;
  final String albumImage;
  final String artist;
  final String dateAdded;
  final String size;
  final String duration;

  Mp3Model({
    required this.path,
    required this.displayName,
    required this.album,
    required this.albumImage,
    required this.artist,
    required this.dateAdded,
    required this.size,
    required this.duration,
  });

  factory Mp3Model.fromJson(Map<String, dynamic> json) => Mp3Model(
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
