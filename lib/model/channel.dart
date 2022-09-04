class Channel {
  Channel({
    this.title,
    this.thumbnail,
    this.description,
    this.subscriberCount,
  });

  String? title;
  String? thumbnail;
  String? description;
  String? subscriberCount;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        title: json["title"],
        thumbnail: json["thumbnail"],
        description: json["description"],
        subscriberCount: json["subscriberCount"],
      );
}
