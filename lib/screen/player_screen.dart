import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/app_controller.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({Key? key}) : super(key: key);

  final item = Get.arguments['item'];
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: item['videoId'],
          flags: YoutubePlayerFlags(
            loop: true,
            autoPlay: true,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
      builder: (_, player) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              player,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(item['channelThumbanil']),
                    ),
                    SizedBox(width: 16),
                    Text(item['channelTitle'])
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 26, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      item['title'],
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: controller.darkMode.value == false
                              ? Colors.black54
                              : Colors.white54,
                        ),
                        SizedBox(width: 6),
                        Text(
                          DateFormat('yyyy-MM-dd')
                              .format(item['publishedAt'].toDate())
                              .toString(),
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 18,
                          color: controller.darkMode.value == false
                              ? Colors.black54
                              : Colors.white54,
                        ),
                        SizedBox(width: 6),
                        Text(
                          NumberFormat('###,###,###,###')
                              .format(item['viewCount']),
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      item['description'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.black26,
              ),
            ],
          ),
        );
      },
    );
  }
}
