import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final double primaryThickness;
  final Color secondaryColor;
  final double secondaryThickness;

  RadialProgress({ 
    @required this.percentage, 
    this.primaryColor = Colors.blue,
    this.primaryThickness = 10.0, 
    this.secondaryColor = Colors.grey,
    this.secondaryThickness = 4.0
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double lastPercentage;

  @override
  void initState() {
    lastPercentage = widget.percentage;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final rangeAnimation = widget.percentage - lastPercentage;
    lastPercentage = widget.percentage;
    
    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: MyRadialProgress(
              percentage: (widget.percentage - rangeAnimation) + (rangeAnimation * controller.value),
              primaryColor: widget.primaryColor,
              primaryThickness: widget.primaryThickness,
              secondaryColor: widget.secondaryColor,
              secondaryThickness: widget.secondaryThickness
            ),
          )
        );
      }
    );
  }
}

class MyRadialProgress extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final double primaryThickness;
  final Color secondaryColor;
  final double secondaryThickness;

  MyRadialProgress({ this.percentage, this.primaryColor, this.primaryThickness, this.secondaryColor, this.secondaryThickness});

  @override
  void paint(Canvas canvas, Size size) {    
    // Circle
    final paint = new Paint()
      ..color = secondaryColor
      ..strokeWidth = secondaryThickness
      ..style = PaintingStyle.stroke;

    Offset center  = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);
    // Arc

    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180.0
    );
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ]
    );

    final arcPaint = new Paint()
      //..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = primaryThickness
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