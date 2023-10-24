import 'package:flutter/material.dart';
import 'package:front_mobile/components/card_saiba_mais_descarte.dart';
import 'package:front_mobile/components/elements/floating_add_button.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/pages/descartes/adddescarte_page.dart';
import 'package:front_mobile/pages/descartes/intro_descartes_page.dart';

class DescartesPage extends StatelessWidget {
  const DescartesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingAddButton(page: AddDescarte()),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Meus descartes',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardSaibaMaisDescarte(
                title: 'Entenda a iniciativa',
                color: Colors.deepPurple,
                icon: Icons.help,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => IntroDescartesPage(),
                    ),
                  );
                },
              ),
              CardSaibaMaisDescarte(
                title: 'Quero fazer um descarte',
                color: Colors.blueAccent,
                icon: Icons.recycling_rounded,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDescarte(),
                    ),
                  );
                },
              ),
            ],
          ),
          const HelpAbout(
              icon: Icons.info_rounded,
              helpText: 'Toque sobre um descarte para visualizar detalhes.'),
          // const CardService(),
        ]),
      ),
    );
  }
}
