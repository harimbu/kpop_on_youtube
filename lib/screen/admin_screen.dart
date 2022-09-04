import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/admin_controller.dart';
import '../layout/default_layout.dart';


class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);
  final controller = Get.find<AdminController>();

  static const String stageId = 'PLL4H1OoeD41-cJGxqj7yOCN5UEzBqmKMB';
  static const String stageName = 'stage';
  static const String bestId = 'PLL4H1OoeD41-exS5wQ3AP1NFYWEfm0DT5';
  static const String bestName = 'best';
  static const String danceId = 'PLL4H1OoeD41_BrWk-SHMv6emwnp81rI3_';
  static const String danceName = 'dance';
  static const String tvId = 'PLL4H1OoeD41802xF5FwqDSEb9-w9COTjM';
  static const String tvName = 'tv';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Adimin',
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => controller.getVideos(tvId, tvName),
              child: Text('tv 가져오기'),
            ),
            ElevatedButton(
              onPressed: () => controller.getVideos(bestId, bestName),
              child: Text('best 가져오기'),
            ),
            ElevatedButton(
              onPressed: () => controller.getVideos(danceId, danceName),
              child: Text('dance 가져오기'),
            ),
            ElevatedButton(
              onPressed: () => controller.getVideos(stageId, stageName),
              child: Text('stage 가져오기'),
            ),
          ],
        ),
      ),
    );
  }
}
