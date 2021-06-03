import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  CustomAppBar({
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        child: Row(
          children: <Widget> [
            Text(text, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            Spacer(),
            Icon(Icons.search, size: 30.0)
          ],
        )
      ),
    );
  }
}