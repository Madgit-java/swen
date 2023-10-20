import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../pages/travel.dart';
import 'card_container.dart';
import 'open_container.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.fun});

  final Function(Never?) fun;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child: createOpenContainer(const Travel(color: Color(0xffe6dbf9), text: 'Travel', textBody: '234',),
                const CardContainer(
              color: Color(0xffe6dbf9),
              image: 'assets/travel_icon.png',
              text: 'Travel',
              subText: "234",
            ), fun),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child:
            createOpenContainer(
                const Travel(color: Color(0xffdef1d9), text: 'Food', textBody: '727',),
                const CardContainer(
              color: Color(0xffdef1d9),
              image: 'assets/food_icon.png',
              text: 'Food',
              subText: "727",
            ),
                fun),
           ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}

