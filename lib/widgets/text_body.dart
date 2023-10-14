import 'package:flutter/material.dart';

class TextBody extends StatefulWidget {
  const TextBody({super.key, this.text, this.plusShow = true,});

  final text;
  final plusShow;

  @override
  State<TextBody> createState() => _TextBodyState();
}

class _TextBodyState extends State<TextBody> {

  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widgetText(){
      return Stack(
        alignment: Alignment.center,
        children: [
           Positioned(left: 20, bottom: 0,
            child: Row(
              children: [
                Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.w400,
                    )
                ),
                const SizedBox(width: 10,),
                const Padding(
                  padding: EdgeInsets.only(top: 35.0),
                  child: Text(
                      "tCO2e",
                      style: TextStyle(color: Color(0x80262D35),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                ),
              ],
            ),
          ),
         widget.plusShow
             ? Positioned(right: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset('assets/plus.png',),
            ),
          )
             : const SizedBox.shrink(),
        ],
      );
    }
    return Column(
      children: [
        SizedBox(height: 92,
          child: PageView(
            controller: _controller,
            children: [
              widgetText(),
              widgetText()
            ]
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Container(
              width: 20.0,
              height: 2.0,
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                shape: BoxShape.rectangle,
                color: _currentPage == index
                    ? const Color(0xFFB693FA)
                    : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}


