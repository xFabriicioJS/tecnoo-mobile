import 'package:flutter/material.dart';
import 'package:front_mobile/components/tab_controller.dart';
import 'package:front_mobile/pages/account/account_settings_page.dart';
import 'package:front_mobile/pages/account/subpages/update_email_page.dart';
import 'package:front_mobile/pages/descartes/descartes_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/account': (context) => const AccountSettingsPage(),
        '/update-email': (context) => UpdateEmailPage(),
      },
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
