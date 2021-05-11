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
  Animation<double> opacity;
  Animation<double> moveRight;
  Animation<double> increaseSize;
  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    // rotation = Tween( begin: 0.0, end: 2.0 * Math.pi ).animate(controller);
    rotation = Tween( begin: 0.0, end: 1.0 * Math.pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.50, curve: Curves.easeOut))
    );

    moveRight = Tween(begin: 1.0, end: 250.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut)
    );

    increaseSize = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.50, curve: Curves.easeOut))
    );

    controller.addListener(() {
      print('Status ${controller.status}');
      if(controller.status == AnimationStatus.completed) {
        controller.repeat();
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
    controller.forward(); // Playing the animation.
    return AnimatedBuilder(
      animation: controller,
      child: _SquareHeader(),
      builder: (BuildContext context, Widget squareChild) {
        return Transform.translate(
          offset: Offset(moveRight.value,0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: increaseSize.value,
                child: squareChild
              )
            ),
          ),
        );
      },
    );
  }
}

