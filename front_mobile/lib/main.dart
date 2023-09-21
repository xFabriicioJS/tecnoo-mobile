import 'package:flutter/material.dart';
import 'package:front_mobile/components/tab_controller.dart';
import 'package:front_mobile/pages/account/account_settings_page.dart';
import 'package:front_mobile/pages/account/subpages/update_email_page.dart';
import 'package:front_mobile/pages/account/subpages/update_password_page.dart';
import 'package:front_mobile/pages/auth/client/signup_page.dart';
import 'package:front_mobile/pages/auth/welcome_page.dart';
import 'package:front_mobile/pages/descartes/descartes_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //Welcome Route
        '/welcome-screen': (context) => const WelcomePage(),
        //Signup Route
        '/signup': (context) => const SignUpPage(),
        //Account Routes
        '/account': (context) => const AccountSettingsPage(),
        '/update-email': (context) => UpdateEmailPage(),
        '/update-password': (context) => const UpdatePasswordPage(),
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
