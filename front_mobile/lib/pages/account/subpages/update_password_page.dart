import 'package:flutter/material.dart';
import 'package:front_mobile/components/elements/custom_button_elevated.dart';
import 'package:front_mobile/components/help_about.dart';
import 'package:front_mobile/mixins/validations_mixins.dart';

class UpdatePasswordPage extends StatefulWidget with ValidationsMixin {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String? checkPasswordsMatch(String? value) {
    if (value != newPassword.text) {
      print(value);
      print(newPassword);
      return "As senhas não coincidem";
    }
    return null;
  }

  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  String? checkEmpty(value) => widget.isNotEmpy(value);

  String? checkNewPassword(value) => widget.combine([
        () => widget.isNotEmpy(value),
        () => widget.hasFiveChars(value),
        () => widget.hasSpecialCharacters(value)
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Atualizar senha',
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
                          "Você precisará informar sua senha atual para atualizar seu endereço de e-mail"),
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
                                obscureText: true,
                                validator: checkEmpty,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: checkNewPassword,
                                controller: newPassword,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Nova senha',
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
                                validator: checkPasswordsMatch,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Confirmar nova senha',
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
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text('Senha atualizada com sucesso!'),
                                    ));
                                  }
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                                child: const Text('Atualizar senha'),
                              )
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
