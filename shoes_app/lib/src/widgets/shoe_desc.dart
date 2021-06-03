import 'package:flutter/material.dart';


class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  ShoeDescription({
    @required this.title, 
    @required this.description
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(description, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54, height: 1.6))
        ],
      )
    );
  }
}