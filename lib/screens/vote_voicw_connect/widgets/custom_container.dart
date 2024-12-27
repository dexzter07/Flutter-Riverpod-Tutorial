import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final String numbers;
  final String title;
  final String icons;
  const CustomContainer(
      {super.key,
      required this.backgroundColor,
      required this.iconColor,
      required this.numbers,
      required this.title,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: backgroundColor,
              blurRadius: 5.0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white38,
                  ),
                  child: Image.asset(
                    icons,
                    color: iconColor,
                    width: 20,
                  )),
              const Spacer()
            ],
          ),
          Text(
            numbers,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
