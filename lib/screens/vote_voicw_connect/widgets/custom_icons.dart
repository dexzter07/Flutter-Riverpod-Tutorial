import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  final String icons;
  final String title;
  const CustomIcons({super.key, required this.icons, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffffffff),
                    Color(0xffffffff),
                  ]),
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(color: Color(0xffe6ebff), blurRadius: 2),
              ]),
          child: Image.asset(
            icons,
            width: 35,
            height: 35,
            color: const Color(0xff001c80),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
