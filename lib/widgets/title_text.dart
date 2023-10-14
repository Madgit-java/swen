import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20,),
        Text(
            text,
            style: const TextStyle(
              color: Color(0xFF262D35),
              fontSize: 36,
              fontWeight: FontWeight.w400,
            )
        ),
      ],
    );
  }
}
