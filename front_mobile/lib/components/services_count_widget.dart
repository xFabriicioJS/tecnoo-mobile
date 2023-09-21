import 'package:flutter/material.dart';

class ServicesCount extends StatelessWidget {
  final String title;
  final Color color;
  final int number;

  const ServicesCount(
      {super.key,
      required this.title,
      required this.color,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: 160,
        height: 160,
        child: Card(
          color: color,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
