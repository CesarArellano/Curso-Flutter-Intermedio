import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquareAnimated(),
      ),
    );
  }
}

class _SquareHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.blue,
    );
  }
}

class SquareAnimated extends StatefulWidget {
  
  @override
  _SquareAnimatedState createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<SquareAnimated> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    // rotation = Tween( begin: 0.0, end: 2.0 * Math.pi ).animate(controller);
    rotation = Tween( begin: 0.0, end: 2.0 * Math.pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
    );
    controller.addListener(() {
      print('Status ${controller.status}');
      if(controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(); // Darle play a la animación
    return AnimatedBuilder(
      animation: controller,
      child: _SquareHeader(),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: rotation.value,
          child: child,
        );
      },
    );
  }
}

