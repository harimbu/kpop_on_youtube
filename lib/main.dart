import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'binding/app_binding.dart';
import 'controller/app_controller.dart';
import 'firebase_options.dart';
import 'screen/app.dart';
import 'screen/player_screen.dart';
import 'theme/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kpop on youtube',
        themeMode: controller.darkMode.value ? ThemeMode.dark : ThemeMode.light,
        darkTheme: Themes.dark,
        theme: Themes.light,
        initialBinding: AppBinding(),
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => App()),
          GetPage(name: '/player', page: () => PlayerScreen()),
        ],
      ),
    );
  }
}
