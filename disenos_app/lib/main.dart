import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/emergency_page.dart';
//import 'package:disenos_app/src/pages/pinterest_page.dart';
//import 'package:disenos_app/src/pages/slideshow_page.dart';
//import 'package:disenos_app/src/pages/pie_charts_page.dart';
//import 'package:disenos_app/src/pages/circular_progress_page.dart';
//import 'package:disenos_app/src/challenges/animated_square.dart';
//import 'package:disenos_app/src/pages/headers_page.dart';
//import 'package:disenos_app/src/pages/animations_page.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: EmergencyPage()
    );
  }
}