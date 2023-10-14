import 'package:flutter/material.dart';

import '../pages/travel.dart';
import 'card_container.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 6,
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const Travel();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, -1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end).chain(
                        CurveTween(curve: curve),
                      );

                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const CardContainer(
                color: Color(0xffe6dbf9),
                image: 'assets/travel_icon.png',
                text: 'Travel',
                subText: "234",
              ),
            ),


        ),
        const SizedBox(
          width: 6,
        ),
        const Expanded(
            child: CardContainer(
          color: Color(0xffdef1d9),
          image: 'assets/food_icon.png',
          text: 'Food',
          subText: "727",
        )),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
