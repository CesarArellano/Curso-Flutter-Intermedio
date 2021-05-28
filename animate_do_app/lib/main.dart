import 'package:flutter/material.dart';

import 'package:animate_do_app/src/pages/screen1_page.dart';
// import 'package:animate_do_app/src/pages/twitter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Screen1Page()
    );
  }
}