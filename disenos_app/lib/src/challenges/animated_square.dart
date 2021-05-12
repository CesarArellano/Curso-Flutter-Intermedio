import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {

  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  Animation<double> moveRight;
  Animation<double> moveUp;
  Animation<double> moveLeft;
  Animation<double> moveDown;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );
    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.50, curve: Curves.bounceOut))
    );
    moveLeft = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.50, 0.75, curve: Curves.bounceOut))
    );
    moveDown = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

    controller.addListener(() {
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
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _SquareHeader(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value - moveLeft.value, moveUp.value - moveDown.value),
          child: child,
        );
      }
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
