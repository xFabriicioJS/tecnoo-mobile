import 'package:flutter/material.dart';

class CustomFilterChip extends StatefulWidget {
  final String title;

  const CustomFilterChip({
    super.key,
    required this.title,
  });

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  bool activated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FilterChip(
        elevation: 2,
        side: const BorderSide(
          color: Colors.transparent,
        ),
        checkmarkColor: Colors.white,
        label: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: activated ? Colors.white : Colors.black.withOpacity(0.6),
          ),
        ),
        selected: activated,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        selectedColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.2),
        onSelected: (value) {
          setState(() {
            activated = value;
          });
        },
      ),
    );
  }
}
