import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        debugShowMaterialGrid: false,
        title: 'Flutter Demo',
        theme: ThemeData(textTheme: GoogleFonts.spaceGroteskTextTheme(),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      );
        }
    );
  }
}


