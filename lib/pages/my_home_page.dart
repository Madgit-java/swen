import 'package:flutter/material.dart';
import 'package:swen/widgets/search_widget.dart';
import 'package:swen/widgets/small_card.dart';
import 'package:swen/widgets/text_body.dart';
import 'package:swen/widgets/title_text.dart';
import '../widgets/big_card.dart';
import '../widgets/build_icon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static final GlobalKey<MyHomePageState> homePageKey = GlobalKey();
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool selected = false;
  late AnimationController _controller;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    selected = false;
    super.dispose();
  }


  void startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _controller.forward();
    selected = true;
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        selected = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xfff8f7f8),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              SlideTransition(
                  position: animation,child: const TitleText(text: "Overview",)),
              const SizedBox(height: 15,),
              const SearchWidget(),
              const SizedBox(height: 5,),
              SizedBox(height: MediaQuery.of(context).size.height - 255,
                child: Stack(
                  children: [
                    const TextBody(text: "1 263",),
                    AnimatedPositioned(
                        width: MediaQuery.of(context).size.width ,
                        top: selected ? 0.0 : 100.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        child: const Column(
                          children: [
                            BigCard(),
                            SizedBox(height: 6,),
                            SmallCard()
                          ],
                        )),
                    //  SizedBox(height: 6,),
                  ],
                ),
              ),
             // SizedBox(height: 15,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color(0xFFB794FB),
        elevation: 0,
        backgroundColor: const Color(0xfff8f7f8),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BuildIcon(index: 0, icon: 'assets/subtract.png', currentIndex: _currentIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BuildIcon(index: 1, icon: 'assets/book.png', currentIndex: _currentIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BuildIcon(index: 2, icon: 'assets/book.png', currentIndex: _currentIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BuildIcon(index: 3, icon: 'assets/list.png', currentIndex: _currentIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BuildIcon(index: 4, icon: 'assets/person.png', currentIndex: _currentIndex),
            label: '',
          ),
      ],
    ),
    );
  }
}
