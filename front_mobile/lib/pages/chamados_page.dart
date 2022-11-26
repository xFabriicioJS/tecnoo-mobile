import 'package:flutter/material.dart';
import 'package:front_mobile/components/card_chamado.dart';
import 'package:front_mobile/components/services_count_widget.dart';

class ChamadosPage extends StatelessWidget {
  const ChamadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Meus chamados',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
        const ChamadoCard(),
      ]),
    );
  }
}
