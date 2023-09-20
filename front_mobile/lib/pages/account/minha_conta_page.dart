import 'package:flutter/material.dart';
import 'package:front_mobile/components/card_saiba_mais_descarte.dart';
import 'package:front_mobile/components/help_about.dart';

class MinhaContaPage extends StatelessWidget {
  const MinhaContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Minha Conta',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .90,
              height: MediaQuery.of(context).size.height * .45,
              child: Card(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.asset(
                        'assets/images/img_avatar.png',
                      ).image,
                      radius: MediaQuery.of(context).size.width * .25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'Fabricio Monteiro',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'FA@MONTEIRO',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .90,
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                      ),
                      title: const Text('Configurações da conta'),
                      subtitle: const Text('Email, imagem de perfil, etc.'),
                      onTap: () {
                        Navigator.of(context).pushNamed("/account");
                      },
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.bug_report_outlined,
                        size: 40,
                      ),
                      title: Text('Informar um problema'),
                      subtitle: Text('Fale conosco para informar um problema.'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.business_center_outlined,
                        size: 40,
                      ),
                      title: Text('Meu contrato'),
                      subtitle: Text('Informações do meu contrato.'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.info_outlined,
                        size: 40,
                      ),
                      title: Text('Sobre a Tecnoo'),
                      subtitle: Text('Conheça mais sobre a Tecnoo.'),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
