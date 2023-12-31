import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swen/widgets/search_widget.dart';
import 'package:swen/widgets/small_card.dart';
import 'package:swen/widgets/text_body.dart';
import 'package:swen/widgets/title_text.dart';
import '../widgets/big_card.dart';
import '../widgets/build_icon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
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
    startAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!selected) {
      startAnimation();
    }
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
      duration: const Duration(milliseconds: 800),
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
    final column = Tween<Offset>(
      begin: const Offset(0.0, -0.1),
      end: const Offset(0.0, 0.12),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          color: const Color(0xfff8f7f8),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 200),
            children: [
              const SizedBox(height: 10,),
              SlideTransition(
                  position: animation,
                  child: const TitleText(text: "Overview",)),
              const SizedBox(height: 15,),
              const SearchWidget(),
              const SizedBox(height: 5,),
              Stack(
                children: [
                  TextBody(text: "1 263", controllerPlus: _controller),
                  SlideTransition(
                      position: column,
                       child: Column(
                          children: [
                            BigCard(fun: (_){
                              _controller.reset();
                              _controller.forward();},),
                            const SizedBox(height: 6,),
                            SmallCard(fun: (_) {
                            _controller.reset();
                            _controller.forward();},),
                            const SizedBox(height: 20,),
                            const Placeholder(),
                          ],
                        )),
                ],
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
