import 'package:get/get.dart';
import 'package:kpop_on_youtube/controller/best_controller.dart';
import 'package:kpop_on_youtube/controller/tv_controller.dart';

import '../controller/admin_controller.dart';
import '../controller/app_controller.dart';
import '../controller/dance_controller.dart';
import '../controller/stage_controller.dart';
import '../service/youtube_api.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YoutubeApi());
    Get.put(AppController());
    Get.put(AdminController());
    Get.put(StageController());
    Get.put(BestController());
    Get.put(DanceController());
    Get.put(TvController());
  }
}
