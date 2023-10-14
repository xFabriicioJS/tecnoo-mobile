import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String title;
  final Color color;

  const TextDivider({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: color),
        ),
      ],
    );
  }
}
