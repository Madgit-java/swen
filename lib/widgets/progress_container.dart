import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key, this.textLeft, this.textRight, this.precent});

  final textLeft;
  final textRight;
  final precent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 66, width: precent, color: Colors.white,),
        Container(
          height: 66,
          decoration: BoxDecoration(border: Border.all(
            color: const Color(0x21262d35),
            width: 1)),
          child: Stack(alignment: Alignment.center,
            children: [
              Positioned(left: 20,
              child: Row(
                children: [
                  Text(
                      textLeft,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                        "kg".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                  )
                ],
              ),
            ),
        Positioned(right: 22,
          child: Text(
          textRight.toUpperCase(),
          style: const TextStyle(color: Color(0x80262D35),
          fontSize: 11,
          fontWeight: FontWeight.w500,
          )
          ),
        )
          ],),),
      ],
    );
  }
}
