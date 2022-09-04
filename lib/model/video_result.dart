import 'page_info.dart';
import 'video.dart';

class VideoResult {
  VideoResult({
    this.nextPageToken,
    this.pageInfo,
    this.items,
  });

  String? nextPageToken;
  PageInfo? pageInfo;
  List<Video>? items;

  factory VideoResult.fromJson(Map<String, dynamic> json) => VideoResult(
        nextPageToken: json["nextPageToken"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items:
            List<Video>.from(json["items"].map((data) => Video.fromJson(data))),
      );
}
