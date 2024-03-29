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
                          width: MediaQuery.of(context).size.width * .80,
                          child: Column(
                            children: [
                              TextFormField(
                                // validator: checkEmpty,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Senha atual',
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              TextFormField(
                                // validator: checkEmpty,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Novo endereço',
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              TextFormField(
                                // validator: checkEmpty,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Insira novamente o endereço',
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 0),
                                child: const Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Text(
                                      'Ao atualizar o seu endereço de e-mail, você será redirecionado para a tela de login.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              CustomButtonElevated(
                                formKey: _formKey,
                                text: "ATUALIZAR",
                              ),
                            ],
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
