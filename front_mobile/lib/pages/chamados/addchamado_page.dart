import 'package:flutter/material.dart';
import 'package:front_mobile/components/elements/custom_button_elevated.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/mixins/validations_mixins.dart';

class AddChamadoPage extends StatefulWidget with ValidationsMixin {
  const AddChamadoPage({super.key});

  @override
  State<AddChamadoPage> createState() => _AddChamadoPageState();
}

class _AddChamadoPageState extends State<AddChamadoPage> {
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
                      width: MediaQuery.of(context).size.width * .90,
                      child: TextFormField(
                        validator: checkEmpty,
                        maxLength: 30,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          icon: Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: const Icon(Icons.construction_rounded),
                          ),
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
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          maxLines: 10,
                          validator: checkEmpty,
                          maxLength: 500,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Insira aqui a descrição do chamado"),
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dropValue,
                      builder: ((context, value, _) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * .90,
                          child: DropdownButton<String>(
                            icon: const Icon(Icons.construction_rounded),
                            isExpanded: true,
                            hint: const Text('Estado do equipamento'),
                            value: (value.isEmpty) ? null : value,
                            onChanged: (choicedValue) =>
                                dropValue.value = choicedValue.toString(),
                            items: equipConditions
                                .map((option) => DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    ))
                                .toList(),
                          ),
                        );
                      }),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dropValue,
                      builder: ((context, value, _) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * .90,
                          child: DropdownButton<String>(
                            icon: const Icon(Icons.house_rounded),
                            isExpanded: true,
                            hint: const Text('Como deseja ser atendido?'),
                            value: (value.isEmpty) ? null : value,
                            onChanged: (choicedValue) =>
                                dropValue.value = choicedValue.toString(),
                            items: serviceAttends
                                .map((option) => DropdownMenuItem(
                                      value: option,
                                      child: Text(option),
                                    ))
                                .toList(),
                          ),
                        );
                      }),
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
                                child: CustomButtonElevated(formKey: _formKey),
                              ),
                            ],
                          ),
                        ))
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
