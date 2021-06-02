import 'package:flutter/material.dart';

import 'package:transitions_app/pages/screen1_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transitions App',
      home: Screen1Page()
    );
  }
}