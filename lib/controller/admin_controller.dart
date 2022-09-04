import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/channel.dart';
import '../model/etc_info.dart';
import '../model/video_result.dart';
import '../service/youtube_api.dart';

class AdminController extends GetxController {
  String nextPageToken = '';
  int totalResults = 1;
  var list = [];

  void getVideos(String playlistId, String collection) async {
    if (totalResults == list.length) return;

    VideoResult finalVideoResult =
        await YoutubeApi.to.loadVideos(playlistId, nextPageToken);

    totalResults = finalVideoResult.pageInfo!.totalResults!;
    if (finalVideoResult.nextPageToken != null) {
      nextPageToken = finalVideoResult.nextPageToken!;
    }

    for (var item in finalVideoResult.items!) {
      var doc = FirebaseFirestore.instance
          .collection(collection)
          .doc(item.snippet!.resourceId!.videoId!);
      EtcInfo etcInfo =
          await YoutubeApi.to.getVideoById(item.snippet!.resourceId!.videoId!);
      Channel channel = await YoutubeApi.to.getChannel(etcInfo.channelId!);
      doc.set({
        'videoId': item.snippet!.resourceId!.videoId,
        'title': item.snippet!.title,
        'description': item.snippet!.description,
        'thumbnail': item.snippet!.thumbnails!.medium!.url,
        'publishedAt': DateTime.parse(etcInfo.publishedAt.toString()),
        'viewCount': int.parse(etcInfo.viewCount.toString()),
        'channelTitle': channel.title,
        'channelThumbanil': channel.thumbnail,
        'channelDescription': channel.description,
        'subscriberCount': int.parse(channel.subscriberCount.toString()),
      });
      list.add(item.snippet!.resourceId!.videoId!);
    }
  }
}
