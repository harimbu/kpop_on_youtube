class Video {
  Video({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet:
            json["snippet"] != null ? Snippet.fromJson(json["snippet"]) : null,
      );
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  String? playlistId;
  int? position;
  ResourceId? resourceId;
  String? videoOwnerChannelTitle;
  String? videoOwnerChannelId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
        videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
        videoOwnerChannelId: json["videoOwnerChannelId"],
      );
}

class ResourceId {
  ResourceId({
    this.kind,
    this.videoId,
  });

  String? kind;
  String? videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: json["standard"] != null
            ? Default.fromJson(json["standard"])
            : null,
        maxres:
            json["maxres"] != null ? Default.fromJson(json["maxres"]) : null,
      );
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}
