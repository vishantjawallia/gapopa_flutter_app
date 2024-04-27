// ignore_for_file: void_checks

import 'package:gapopa_flutter_app/config/config.dart';
import 'package:gapopa_flutter_app/routes.dart';
import 'package:gapopa_flutter_app/themes/theme.dart';
import 'package:gapopa_flutter_app/views/home/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Config.APP_NAME,
      themeMode: ThemeMode.light,
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      home: const HomeView(),
      getPages: routes,
    );
  }
}
// 
// class MainController extends GetxController {
// 
// }
// 