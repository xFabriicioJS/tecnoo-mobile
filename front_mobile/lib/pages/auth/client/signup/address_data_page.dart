import 'package:flutter/material.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/extensions.dart';
import 'package:front_mobile/mixins/validations_mixins.dart';
import 'package:front_mobile/utils/constants.dart';

class AddressDataPage extends StatefulWidget with ValidationsMixin {
  const AddressDataPage({
    super.key,
  });

  @override
  State<AddressDataPage> createState() => _AddressDataPageState();
}

class _AddressDataPageState extends State<AddressDataPage> {
  final _formKey = GlobalKey<FormState>();
  final dropValue = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dados de endereço",
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 4,
          surfaceTintColor: Colors.white,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          // validator: checkEmpty,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'CEP',
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
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: checkNewPassword,
                          // controller: newPassword,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Logradouro',
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
                          obscureText: true,
                          // validator: checkPasswordsMatch,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Número',
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
                          obscureText: true,
                          // validator: checkPasswordsMatch,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Complemento',
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
                          obscureText: true,
                          // validator: checkPasswordsMatch,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Bairro',
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
                          obscureText: true,
                          // validator: checkPasswordsMatch,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Cidade',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: dropValue,
                          builder: ((context, value, _) {
                            return Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              width: MediaQuery.of(context).size.width * .90,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text('Estado'),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (choicedValue) =>
                                    dropValue.value = choicedValue.toString(),
                                items: states.entries
                                    .map((option) => DropdownMenuItem(
                                          value: option.key,
                                          child: Text(option.value),
                                        ))
                                    .toList(),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const HelpAbout(
                    helpText:
                        'Ao clicar em cadastrar, você concorda com os termos de uso.',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Senha atualizada com sucesso!'),
                              ));
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  "#198754".toColor()),
                              minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          child: const Text(
                            'CADASTRAR',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
