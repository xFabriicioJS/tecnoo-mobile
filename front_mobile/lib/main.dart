import 'package:flutter/material.dart';
import 'package:front_mobile/components/tab_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purpleAccent,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontWeight: FontWeight.w700),
            labelMedium: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            )),
      ),
      home: const TabControllerWidget(),
    );
  }
}
