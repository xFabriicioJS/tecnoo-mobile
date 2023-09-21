import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonElevated extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final String text;

  const CustomButtonElevated({
    super.key,
    required GlobalKey<FormState> formKey,
    icon,
    this.text = "ENVIAR",
  }) : _formKey = formKey;

  @override
  State<CustomButtonElevated> createState() => _CustomButtonElevatedState();
}

class _CustomButtonElevatedState extends State<CustomButtonElevated> {
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(8),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            onPressed: () {
              if (widget._formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Chamado adicionado com sucesso'),
                  ),
                );
              }
            },
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
            ),
          )
        : ElevatedButton.icon(
            icon: Icon(icon),
            label: Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
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
              if (widget._formKey.currentState!.validate()) {
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
