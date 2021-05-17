import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  
  double percentage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: MyRadialProgress(percentage),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          percentage += 10;
          if (percentage > 100)
            percentage = 0;
          setState(() { });
        },
      ),
    );
  }
}

class MyRadialProgress extends CustomPainter {
  final percentage;

  MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {    
    // Circle
    final paint = new Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Offset center  = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);
    // Bow
    final arcPaint = new Paint()
      ..color = Colors.pink
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    
    // Filled part
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      arcPaint
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}