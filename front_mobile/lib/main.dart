import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front_mobile/components/tab_controller.dart';
import 'package:front_mobile/utils/constants.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 73, 4, 85),
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
