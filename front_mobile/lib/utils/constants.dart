import 'package:flutter/material.dart';
import 'package:front_mobile/components/tab_controller.dart';
import 'package:front_mobile/pages/account/account_settings_page.dart';
import 'package:front_mobile/pages/account/subpages/update_email_page.dart';
import 'package:front_mobile/pages/account/subpages/update_password_page.dart';
import 'package:front_mobile/pages/auth/client/login/login_page.dart';
import 'package:front_mobile/pages/auth/client/signup_page.dart';
import 'package:front_mobile/pages/auth/welcome_page.dart';
import 'package:front_mobile/pages/chamados/addchamado_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  //Home
  '/home': (context) => const TabControllerWidget(),

  // Welcome Route
  '/welcome-screen': (context) => const WelcomePage(),
  // Signup Route
  '/signup': (context) => const SignUpPage(),
  // Account Routes
  '/account': (context) => const AccountSettingsPage(),
  '/update-email': (context) => UpdateEmailPage(),
  '/update-password': (context) => const UpdatePasswordPage(),
  // Client Login Route
  '/login': (context) => const ClientLoginPage(),
  // Add chamado
  '/add-chamado': (context) => const AddChamadoPage(),

  // Admin Login Route
  // '/admin-login': (context) => const AdminLoginPage(),
};
