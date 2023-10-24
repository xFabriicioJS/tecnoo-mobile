import 'dart:developer';

import 'package:brasil_datetime/brasil_datetime.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  dynamic infoCard;
  final IconData icon;
  final Color iconColor;
  final Color backgroundIconColor;

  CustomCard({
    super.key,
    this.infoCard,
    required this.icon,
    required this.iconColor,
    required this.backgroundIconColor,
  });

  @override
  Widget build(BuildContext context) {
    log(infoCard.toString());

    return Container();
  }
}
