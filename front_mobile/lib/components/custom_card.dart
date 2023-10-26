// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brasil_datetime/brasil_datetime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundIconColor;

  dynamic infoCard;

  CustomCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.backgroundIconColor,
    required this.infoCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed('/chamados/${infoCard.id}', arguments: infoCard);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      infoCard.titulo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      DateTime.now().horaMinuto(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      infoCard?.descricao,
                      style: const TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.w400),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: backgroundIconColor,
                      child: Icon(
                        icon,
                        color: iconColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
