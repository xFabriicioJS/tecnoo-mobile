import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_mobile/mixins/validations_mixins.dart';
import 'package:front_mobile/pages/auth/client/signup/address_data_page.dart';

class PFSignupPage extends StatelessWidget {
  const PFSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Card(
                  elevation: 4,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.person_add_alt_1_outlined,
                          size: 64,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: const Text(
                            'Cadastro de Pessoa Física',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Text(
                          "Insira seus dados abaixo para realizar o cadastro.",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const PFForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class PFForm extends StatefulWidget with ValidationsMixin {
  const PFForm({
    super.key,
  });

  @override
  State<PFForm> createState() => _PFFormState();
}

class _PFFormState extends State<PFForm> {
  final _formKey = GlobalKey<FormState>();

  String? emailValidation(String? value) => widget.combine([
        () => widget.hasFiveChars(value),
        () => widget.isNotEmpy(value),
        () => widget.emailValidation(value),
      ]);

  String? basicValidation(String? value) => widget.combine([
        () => widget.isNotEmpy(value),
        () => widget.hasFiveChars(value),
        () => widget.containsNumbers(value, "Este campo só pode conter letras")
      ]);

  String? checkNewPassword(value) => widget.combine([
        () => widget.isNotEmpy(value),
        () => widget.hasFiveChars(value),
        () => widget.hasSpecialCharacters(value)
      ]);

  String? checkCPF(String? value) => widget.isCPF(value);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    const Text(
                      "Dados pessoais",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextFormField(
                      validator: basicValidation,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      validator: checkCPF,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'CPF',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Telefone',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: emailValidation,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: checkNewPassword,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddressDataPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                      child: const Text(
                        'PROSSEGUIR',
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
    );
  }
}
