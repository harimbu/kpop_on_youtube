import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/app_controller.dart';


class GridItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final item;
  final int index;
  GridItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: item['thumbnail'],
                // width: 110,
                // height: 70,
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
          SizedBox(height: 8),
          Text(
            item['title'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 6),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.calendar_month,
          //       size: 16,
          //       color: controller.darkMode.value == false
          //           ? Colors.black54
          //           : Colors.white54,
          //     ),
          //     SizedBox(width: 2),
          //     Text(
          //       DateFormat('yyyy-MM-dd')
          //           .format(item['publishedAt'].toDate())
          //           .toString(),
          //       style: TextStyle(fontSize: 11),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                size: 16,
                color: controller.darkMode.value == false
                    ? Colors.black54
                    : Colors.white54,
              ),
              SizedBox(width: 2),
              Text(
                NumberFormat('###,###,###,###').format(item['viewCount']),
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
