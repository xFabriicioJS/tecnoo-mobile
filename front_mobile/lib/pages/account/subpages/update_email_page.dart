import 'package:flutter/material.dart';
import 'package:front_mobile/components/elements/custom_button_elevated.dart';
import 'package:front_mobile/components/help_about.dart';

class UpdateEmailPage extends StatelessWidget {
  UpdateEmailPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Atualizar endereço',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            elevation: 2,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const HelpAbout(
                      icon: Icons.info,
                      helpText:
                          "Para atualizar seu endereço de e-mail será necessário informar a sua senha atual"),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .90,
                          child: TextFormField(
                            // validator: checkEmpty,
                            maxLength: 30,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              icon: Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: const Icon(Icons.recycling_rounded),
                              ),
                              labelText: 'Qual hardware deseja descartar?',
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
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              maxLines: 10,
                              // validator: checkEmpty,
                              maxLength: 500,
                              decoration: const InputDecoration.collapsed(
                                  hintText:
                                      "Insira aqui a descrição do descarte"),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 0),
                                  child: const Text(
                                    'Ao enviar a sua solicitação, você concorda com os termos de uso.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
