import 'package:flutter/material.dart';
import 'package:disenos_app/src/challenges/animated_square.dart';
//import 'package:disenos_app/src/pages/headers_page.dart';
//import 'package:disenos_app/src/pages/animations_page.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AnimatedSquarePage()
    );
  }
}