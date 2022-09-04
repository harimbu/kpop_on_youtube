import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/grid_item.dart';
import '../component/list_item.dart';
import '../controller/app_controller.dart';
import '../controller/stage_controller.dart';
import '../layout/default_layout.dart';

class StageScreen extends StatelessWidget {
  StageScreen({Key? key}) : super(key: key);
  final controller = Get.find<StageController>();
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Stage',
      body: Obx(
        () => appController.gridView.value
            ? Container(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: controller.videoList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(
                        '/player',
                        arguments: {
                          'item': controller.videoList[index],
                        },
                      ),
                      child: GridItem(
                        item: controller.videoList[index],
                        index: index,
                      ),
                    );
                  },
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: controller.videoList.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => Get.toNamed('/player', arguments: {
                        'item': controller.videoList[index],
                      }),
                      child: ListItem(
                        item: controller.videoList[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
