import 'package:flutter/material.dart';

class LogoScreenPage extends StatelessWidget {
  final String title;
  final String image;

  const LogoScreenPage({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Image.asset(
            image,
            scale: 3.0,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
