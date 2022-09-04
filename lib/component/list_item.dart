import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/app_controller.dart';


class ListItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final item;
  final int index;
  ListItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(bottom: 12),
        // height: 80,
        child: Row(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: item['thumbnail'],
                  width: 120,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  // width: 30,
                  // ignore: unrelated_type_equality_checks
                  color: controller.darkMode.value
                      ? Colors.black.withOpacity(0.8)
                      : Colors.white.withOpacity(0.8),
                  child: Text('${index + 1}'),
                ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.calendar_month,
                      //   size: 16,
                      //   color: controller.darkMode.value == false
                      //       ? Colors.black54
                      //       : Colors.white54,
                      // ),
                      // SizedBox(width: 2),
                      // Text(
                      //   DateFormat('yyyy-MM-dd')
                      //       .format(item['publishedAt'].toDate())
                      //       .toString(),
                      //   style: TextStyle(fontSize: 12),
                      // ),
                      // SizedBox(width: 10),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 16,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
