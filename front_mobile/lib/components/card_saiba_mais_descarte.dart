import 'package:flutter/material.dart';

class CardSaibaMaisDescarte extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Function()? onPressed;

  const CardSaibaMaisDescarte({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: 160,
        height: 160,
        child: Card(
          color: color,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Icon(
                  icon,
                  size: 50,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
