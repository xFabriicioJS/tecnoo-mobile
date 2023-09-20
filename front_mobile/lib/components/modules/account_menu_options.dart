import 'package:flutter/material.dart';

class AccountMenuOptions extends StatelessWidget {
  const AccountMenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .90,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.account_circle_sharp,
                size: 35,
              ),
              title: Text(
                'Alterar meu email',
                style: defaultTextStyle(),
              ),
              subtitle: const Text('fa@gmail.com'),
              onTap: () {
                Navigator.of(context).pushNamed("/update-email");
              },
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              leading: const Icon(
                Icons.key_rounded,
                size: 35,
              ),
              title: Text(
                'Alterar minha senha',
                style: defaultTextStyle(),
              ),
              subtitle: const Text('******'),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                size: 35,
              ),
              title: Text(
                'Atualizar contatos',
                style: defaultTextStyle(),
              ),
              subtitle: const Text('32323122124'),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              leading: const Icon(
                Icons.delete_forever_sharp,
                size: 35,
              ),
              title: Text(
                'Excluir minha conta',
                style: TextStyle(
                    color: Colors.red[800],
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle defaultTextStyle() {
    return const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
    );
  }
}
