import 'package:flutter/material.dart';

class HelpAbout extends StatelessWidget {
  final IconData icon;
  final String helpText;

  const HelpAbout({super.key, required this.icon, required this.helpText});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.yellowAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * .80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Text(
                helpText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
