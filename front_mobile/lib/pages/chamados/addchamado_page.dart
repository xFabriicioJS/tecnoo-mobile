import 'package:flutter/material.dart';
import 'package:front_mobile/components/help_about.dart';

class AddChamadoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddChamadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicionar novo chamado',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 8,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Image(
                  image: Image.asset('assets/images/abrir-chamado.jpg',
                          fit: BoxFit.cover)
                      .image),
            ),
            const HelpAbout(
                icon: Icons.info_rounded,
                helpText:
                    'Insira os dados abaixo para solicitar um novo chamado'),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .80,
                      child: TextFormField(
                        maxLength: 30,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.construction_rounded),
                          labelText: 'Insira o título do chamado',
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
