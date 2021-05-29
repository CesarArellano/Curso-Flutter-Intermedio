import 'package:flutter/material.dart';

import 'package:my_unplash_app/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Unplash App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
      },
    );
  }
}