import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  final Color color;
  final Widget page;

  const FloatingAddButton({
    super.key,
    this.color = Colors.blue,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 8,
      backgroundColor: color,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
