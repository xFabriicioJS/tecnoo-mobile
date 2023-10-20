import 'package:brasil_datetime/brasil_datetime.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.infoCard});

  var infoCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Informação sobre o card"),
              Text(DateTime.now().horaMinuto()),
            ],
          ),
          Row(
            children: [
              Text('Descrição sobre o card'),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
