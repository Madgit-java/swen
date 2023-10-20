import 'package:flutter/material.dart';

import '../pages/travel.dart';
import 'card_container.dart';
import 'open_container.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({super.key, required this.fun});

  final Function(Never?) fun;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: createOpenContainer(
              const Travel(
                color: Color(0xfff0d9d5),
                text: 'Shopping',
                textBody: '155',
              ),
              const CardContainer(
                color: Color(0xfff0d9d5),
                height: 150.0,
                image: 'assets/shoping_icon.png',
                text: 'Shopping',
                subText: "155",
              ),
              fun),
        ),
        Expanded(
          child: createOpenContainer(
              const Travel(
                color: Color(0xffd8f0f6),
                text: 'Home',
                textBody: '39',
              ),
              const CardContainer(
                color: Color(0xffd8f0f6),
                height: 150.0,
                image: 'assets/home_icon.png',
                text: 'Home',
                subText: "39",
              ),
              fun),
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
            child: createOpenContainer(
                const Travel(
                  color: Color(0xffececec),
                  text: 'Other',
                  textBody: '39',
                ),
                const CardContainer(
                  color: Color(0xffececec),
                  height: 150.0,
                  image: 'assets/other_icon.png',
                  text: 'Other',
                  subText: "39",
                ),
                fun)),
        SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
