import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonElevated extends StatelessWidget {
  const CustomButtonElevated({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.add_rounded),
      label: const Text(
        'ENVIAR',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(8),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
        iconColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Chamado adicionado com sucesso'),
            ),
          );
        }
      },
    );
  }
}
