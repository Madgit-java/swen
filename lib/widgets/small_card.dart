import 'package:flutter/material.dart';

import 'card_container.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 6,),
        Expanded(child: CardContainer(color: Color(0xfff0d9d5), height: 150.0, image: 'assets/shoping_icon.png',text: 'Shopping', subText: "155",)),
        SizedBox(width: 4,),
        Expanded(child: CardContainer(color: Color(0xffd8f0f6), height: 150.0, image: 'assets/home_icon.png',text: 'home', subText: "39",)),
        SizedBox(width: 4,),
        Expanded(child: CardContainer(color: Color(0xffececec), height: 150.0, image: 'assets/other_icon.png',text: 'Other', subText: "39",)),
        SizedBox(width: 6,),
      ],
    );
  }
}
