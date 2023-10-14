import 'package:flutter/material.dart';

class BuildIcon extends StatelessWidget {
  const BuildIcon({super.key, this.index, this.icon, this.currentIndex});

  final index;
  final icon;
  final currentIndex;

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? Colors.white
                  : Colors.transparent,
            ),
            child: isActive
                ? Image.asset(
              icon,
              color: const Color(0xFFB794FB),
            )
                : Image.asset(
              icon,
              color: Colors.grey,
            ),
          ),
        ],
      );
  }
}
