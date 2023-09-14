import 'package:flutter/material.dart';
import 'package:front_mobile/components/card_service.dart';
import 'package:front_mobile/components/elements/floating_add_button.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/components/services_count_widget.dart';
import 'package:front_mobile/pages/chamados/addchamado_page.dart';

class ChamadosPage extends StatelessWidget {
  const ChamadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAddButton(
        page: AddChamadoPage(),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 73, 4, 85),
            Colors.deepPurple,
          ],
        )),
        child: const SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Meus chamados',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ServicesCount(
                  title: 'Chamados abertos',
                  color: Colors.greenAccent,
                  number: 0,
                ),
                ServicesCount(
                  title: 'Chamados finalizados',
                  color: Colors.redAccent,
                  number: 0,
                ),
              ],
            ),
            HelpAbout(
                icon: Icons.info_rounded,
                helpText: 'Toque sobre um chamado para visualizar detalhes.'),
            CardService(),
          ]),
        ),
      ),
    );
  }
}