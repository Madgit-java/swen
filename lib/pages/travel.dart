import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swen/widgets/search_widget.dart';
import 'package:swen/widgets/small_card.dart';
import 'package:swen/widgets/text_body.dart';
import 'package:swen/widgets/title_text.dart';
import '../widgets/big_card.dart';
import '../widgets/build_icon.dart';
import '../widgets/progress_container.dart';
import 'my_home_page.dart';


class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

    List<Widget> progressContainers = [
      ProgressContainer(textLeft: "56", textRight: "Car \n57%", precent: 57.w),
      ProgressContainer(textLeft: "32", textRight: "Public transport \n23%", precent: 23.w),
      ProgressContainer(textLeft: "14", textRight: "Bicycle \n7%", precent: 7.w),
    ];
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const MyHomePage();
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
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return const MyHomePage();
        // }));
        // Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffe6dbf9),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xffe6dbf9),
                child:  Column(
                  children: [
                    const SizedBox(height: 10,),
                    SizedBox(width: MediaQuery.of(context).size.width, height: 50,
                      child: Stack(alignment: Alignment.center,
                        children: [
                          Positioned(left: 22,
                            child: SlideTransition(
                              position: animation,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return MyHomePage();
                                      }));
                                    },
                                    child: Image.asset('assets/arrow.png'),
                                  ),
                                  const Positioned(left: 70, child: TitleText(text: "Travel")),
                                ],
                              ),
                            ),
                          ),
                          Positioned(right: 20, child: Image.asset('assets/circle_tr.png',),),
                          Positioned(right: 20, child: Image.asset('assets/travel_icon.png',),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const SearchWidget(),
                    const SizedBox(height: 5,),
                    const TextBody(text: '234', plusShow: false,),
                    const SizedBox(height: 15,),
                    SizedBox(height: 200,
                      child: ListView.builder(
                        itemCount: progressContainers.length,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0.0,
                                  end: 1.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: _controller,
                                    curve: Interval(
                                      (index + 1) / progressContainers.length,
                                      1.0,
                                      curve: Curves.easeInOut,
                                    ),
                                  ),
                                ),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0.0, 1.0),
                                    end: const Offset(0.0, 0.0),
                                  ).animate(
                                    CurvedAnimation(
                                      parent: _controller,
                                      curve: Interval(
                                        (index + 1) / progressContainers.length,
                                        1.0,
                                        curve: Curves.easeInOut,
                                      ),
                                    ),
                                  ),
                                  child: child,
                                ),
                              );
                            },
                            child: progressContainers[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
