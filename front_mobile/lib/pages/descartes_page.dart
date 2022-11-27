import 'package:flutter/material.dart';
import 'package:front_mobile/components/card_chamado.dart';
import 'package:front_mobile/components/card_descarte.dart';
import 'package:front_mobile/components/card_saiba_mais_descarte.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/components/services_count_widget.dart';

class DescartesPage extends StatelessWidget {
  const DescartesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Meus descartes',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
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
                  print('teste');
                },
              ),
              CardSaibaMaisDescarte(
                title: 'Quero fazer um descarte',
                color: Colors.blueAccent,
                icon: Icons.recycling_rounded,
              ),
            ],
          ),
          const HelpAbout(
              icon: Icons.info_rounded,
              helpText: 'Toque sobre um descarte para visualizar detalhes.'),
          const CardDescarte(),
        ]),
      ),
    );
  }
}
