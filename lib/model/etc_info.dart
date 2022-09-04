class EtcInfo {
  EtcInfo({this.publishedAt, this.viewCount, this.channelId});

  String? publishedAt;
  String? viewCount;
  String? channelId;

  factory EtcInfo.fromJson(Map<String, dynamic> json) => EtcInfo(
        publishedAt: json["publishedAt"],
        viewCount: json["viewCount"],
        channelId: json["channelId"],
      );
}
