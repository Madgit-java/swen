import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.color, this.height = 282.0, required this.image, this.text, this.subText});

  final text;
  final subText;
  final color;
  final height;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Stack(alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/circle_tr.png',
                ),
                Image.asset(
                  image,
                ),
              ],
            ),
          ),
          Positioned(bottom: 36, left: 10,
              child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              )
          )),
          Positioned(bottom: 10, left: 10,
            child: Row(
              children: [
                Text(
                    subText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )
                ),
                const Text(
                    "kg",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
