import 'package:flutter/material.dart';
import 'package:front_mobile/components/tab_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: "Meu Tecnoo",
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.greenAccent,
            tertiary: Colors.teal),
      ),
      home: const TabControllerWidget(),
    );
  }
}
