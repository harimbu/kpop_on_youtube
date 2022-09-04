import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StageController extends GetxController {
  var isLoading = false.obs;
  RxList videoList = [].obs;

  @override
  void onInit() {
    super.onInit();
    _getVideos();
  }

  Future _getVideos() async {
    var response = await FirebaseFirestore.instance
        .collection('stage')
        .orderBy('viewCount', descending: true)
        .get();

    final result = response.docs.map((doc) {
      return doc.data();
    });
    videoList.addAll(result);
  }
}
