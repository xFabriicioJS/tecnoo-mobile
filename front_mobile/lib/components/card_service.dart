import 'package:flutter/material.dart';
import 'package:front_mobile/components/custom_card.dart';

class CardService extends StatefulWidget {
  const CardService({super.key, required this.cards});

  final List<dynamic> cards;

  @override
  State<CardService> createState() => _CardServiceState();
}

class _CardServiceState extends State<CardService> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * .85,
          child: Column(
            children: _renderCards(),
          ),
        ),
      );
    });
  }

  List<Widget> _renderCards() {
    return widget.cards
        .map(
          (card) => CustomCard(
            infoCard: card,
          ),
        )
        .toList();
  }
}
