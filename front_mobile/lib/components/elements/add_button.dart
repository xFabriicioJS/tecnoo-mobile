import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed("/add-chamado");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        minimumSize: Size(size.width, 80),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle_outlined,
            color: Colors.white,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 2),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
