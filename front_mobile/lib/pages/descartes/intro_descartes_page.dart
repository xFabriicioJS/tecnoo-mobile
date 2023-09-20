import 'package:flutter/material.dart';
import 'package:animated_introduction/animated_introduction.dart';
import 'package:front_mobile/pages/descartes/adddescarte_page.dart';

class IntroDescartesPage extends StatelessWidget {
  IntroDescartesPage({super.key});

  final List<SingleIntroScreen> pages = [
    const SingleIntroScreen(
      title: 'Descarte solidário',
      description:
          'O descarte solidário é uma ação da Tecnoo para promover a reciclagem de equipamentos eletrônicos e eletrônicos de consumo e de pilhas e baterias de maneira não-prejudicial ao meio-ambiente.',
      imageAsset: 'assets/images/descarte1.jpg',
    ),
    const SingleIntroScreen(
      title: 'Como funciona',
      description:
          'O ponto de descarte é no próprio prédio da Tecnoo, na Avenida Itaquera, e deverá ser feito o agendemento, que deverá ser feito pelo telefone (11) 2091-1000, pelo site, ou por esse aplicativo. ',
      imageAsset: 'assets/images/descarte2.jpg',
    ),
    const SingleIntroScreen(
      title: 'Venha fazer parte!',
      description:
          ' Caso você tenha interesse, já comece a juntar todo o seu material e ajude o crescimento sustentável na nossa cidade. Esperamos ansiosos por você.',
      imageAsset: 'assets/images/descarte3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
          slides: pages,
          skipText: "Voltar",
          onSkip: () {
            Navigator.of(context).pop();
          },
          nextText: "Próximo",
          doneWidget: const Text("Prosseguir",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
          footerBgColor: Color(Theme.of(context).primaryColor.value),
          onDone: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const AddDescarte();
            }));
          }),
    );
  }
}
