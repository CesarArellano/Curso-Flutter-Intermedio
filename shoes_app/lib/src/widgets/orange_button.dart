import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  OrangeButton({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text('$text', style: TextStyle(color: Colors.white))
    );
  }
}
