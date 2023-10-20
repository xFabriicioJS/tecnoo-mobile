import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/components/tab_controller.dart';
import 'package:front_mobile/extensions.dart';
import 'package:front_mobile/utils/constants.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: appRoutes,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: "#6200EE".toColor(),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontWeight: FontWeight.w700),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const TabControllerWidget(),
    );
  }
}
