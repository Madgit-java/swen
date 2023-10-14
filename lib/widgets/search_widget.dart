import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 34,
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color(0x21262d35),
              width: 1),
          borderRadius: BorderRadius.circular(9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
                "Week",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset('assets/filter.png'),
          ),
        ],),
    );
  }
}
