import 'package:flutter/material.dart';

import 'package:transitions_app/pages/screen2_page.dart';

class Screen1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1')
      ),
      body: Center(
        child: Text('Página 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time),
        onPressed: () {
          Navigator.push(context, _createRoute());
        },
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => Screen2Page(),
      // transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curveAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        // return SlideTransition(
        //   position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero).animate(curveAnimation),
        //   child: child,
        // );

        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
          child: child,
        );
      }
    );
  }
}