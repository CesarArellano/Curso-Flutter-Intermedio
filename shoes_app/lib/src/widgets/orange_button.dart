import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;

  OrangeButton({this.text, this.width = 150, this.height = 50, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: this.color, borderRadius: BorderRadius.circular(100)),
        child: Text('$text', style: TextStyle(color: Colors.white)));
  }
}
