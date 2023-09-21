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
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * .80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  helpText,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
