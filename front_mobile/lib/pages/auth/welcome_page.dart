import 'package:flutter/material.dart';
import 'package:front_mobile/components/elements/logo_screen_page.dart';
import 'package:front_mobile/extensions.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ['#732F78'.toColor(), "#F55C6E".toColor()]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60),
                height: MediaQuery.of(context).size.height * .40,
                child: const LogoScreenPage(
                  title: "Tecnoo.",
                  image: 'assets/images/logonova.png',
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
