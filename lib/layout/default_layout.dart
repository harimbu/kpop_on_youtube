import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';
import '../screen/admin_screen.dart';


class DefaultLayout extends StatefulWidget {
  final String? title;
  final Widget body;
  DefaultLayout({Key? key, this.title, required this.body}) : super(key: key);

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? 'kpop on youtube'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => controller.toggleViewMode(),
              icon: controller.gridView.value
                  ? Icon(Icons.format_list_numbered)
                  : Icon(Icons.grid_view),
            ),
            IconButton(
              onPressed: () => controller.changeTheme(),
              icon: controller.darkMode.value
                  ? Icon(Icons.light_mode_outlined)
                  : Icon(Icons.dark_mode_outlined),
            ),
            IconButton(
              onPressed: () => Get.to(() => AdminScreen()),
              icon: Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: widget.body,
      ),
    );
  }
}
