import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';
import 'best_screen.dart';
import 'dance_screen.dart';
import 'stage_screen.dart';
import 'tv_screen.dart';



class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.tv:
            return TvScreen();
          case RouteName.best:
            return BestScreen();
          case RouteName.dance:
            return DanceScreen();
          case RouteName.stage:
            return StageScreen();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePageIndex,
          showSelectedLabels: true,
          selectedItemColor:
              controller.darkMode.value == true ? Colors.white : Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/tv.svg',
                color:
                    controller.darkMode.value ? Colors.white30 : Colors.black54,
              ),
              activeIcon: SvgPicture.asset(
                'assets/tv.svg',
                color: controller.darkMode.value ? Colors.white : Colors.black,
              ),
              label: "TV",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/best.svg',
                color:
                    controller.darkMode.value ? Colors.white30 : Colors.black54,
              ),
              activeIcon: SvgPicture.asset(
                'assets/best.svg',
                color: controller.darkMode.value ? Colors.white : Colors.black,
              ),
              label: "best",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/dance.svg',
                color:
                    controller.darkMode.value ? Colors.white30 : Colors.black54,
              ),
              activeIcon: SvgPicture.asset(
                'assets/dance.svg',
                color: controller.darkMode.value ? Colors.white : Colors.black,
              ),
              label: "dance",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/hot.svg',
                color:
                    controller.darkMode.value ? Colors.white30 : Colors.black54,
              ),
              activeIcon: SvgPicture.asset(
                'assets/hot.svg',
                color: controller.darkMode.value ? Colors.white : Colors.black,
              ),
              label: "stage",
            ),
          ],
        ),
      ),
    );
  }
}
