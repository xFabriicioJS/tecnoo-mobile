import 'package:flutter/material.dart';
import 'package:front_mobile/components/elements/custom_button_elevated.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/mixins/validations_mixins.dart';

class AddDescarte extends StatefulWidget with ValidationsMixin {
  const AddDescarte({super.key});

  @override
  State<AddDescarte> createState() => _AddDescarteState();
}

class _AddDescarteState extends State<AddDescarte> {
  final _formKey = GlobalKey<FormState>();
  final dropValue = ValueNotifier('');
  final equipConditions = [
    'Funcionando',
    'Funcionando parcialmente',
    'Não funcionando'
  ];
  final serviceAttends = [
    'No domicílio',
    'No laboratório',
    'Remoto (caso possível)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        title: const Text(
          'Solicitar novo descarte',
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
                    'Insira os dados abaixo para solicitar um novo descarte'),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .90,
                      child: TextFormField(
                        validator: checkEmpty,
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
                          validator: checkEmpty,
                          maxLength: 500,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Insira aqui a descrição do descarte"),
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
                            FractionallySizedBox(
                                widthFactor: 1.0,
                                child: CustomButtonElevated(formKey: _formKey)),
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
    );
  }

  String? checkEmpty(value) => widget.combine(
      [() => widget.isNotEmpy(value), () => widget.hasFiveChars(value)]);
}
