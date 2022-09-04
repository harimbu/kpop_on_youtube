import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kpop_on_youtube/model/channel.dart';
import 'package:kpop_on_youtube/model/etc_info.dart';

import '../model/video_result.dart';

class YoutubeApi extends GetConnect {
  static YoutubeApi get to => Get.find();
  static String apikey = dotenv.get('API_KEY');

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://www.googleapis.com';
  }

  Future<VideoResult> loadVideos(String playlistId, String token) async {
    const part = 'snippet';
    const channelId = 'UCwu-E1f-CSjWILGcoVdF-Ng';
    final key = apikey;
    const maxResults = 50;
    final url =
        '/youtube/v3/playlistItems?part=$part&channelId=$channelId&key=$key&playlistId=$playlistId&maxResults=$maxResults&pageToken=$token';
    final response = await get(url);
    return VideoResult.fromJson(response.body);
  }

  Future getVideoById(String videoId) async {
    const part = 'snippet,statistics';
    final key = apikey;
    final url = '/youtube/v3/videos?part=$part&key=$key&id=$videoId';
    final response = await get(url);
    final etcInfo = {
      "publishedAt": response.body['items'][0]['snippet']['publishedAt'],
      "viewCount": response.body['items'][0]['statistics']['viewCount'],
      "channelId": response.body['items'][0]['snippet']['channelId']
    };
    return EtcInfo.fromJson(etcInfo);
  }

  Future getChannel(String channelId) async {
    const part = 'snippet,statistics';
    final key = apikey;
    final url = '/youtube/v3/channels?part=$part&key=$key&id=$channelId';
    final response = await get(url);
    final channelInfo = {
      "title": response.body['items'][0]['snippet']['title'],
      "description": response.body['items'][0]['snippet']['description'],
      "subscriberCount": response.body['items'][0]['statistics']
          ['subscriberCount'],
      "thumbnail": response.body['items'][0]['snippet']['thumbnails']['default']
          ['url'],
    };
    return Channel.fromJson(channelInfo);
  }
}
