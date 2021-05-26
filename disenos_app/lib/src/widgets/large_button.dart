import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LargeButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color firstColor;
  final Color secondaryColor;
  final Function onPressed;

  LargeButton({ 
    this.icon = FontAwesomeIcons.calendar, 
    @required this.text, 
    this.firstColor = Colors.grey, 
    this.secondaryColor = Colors.blueGrey, 
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(      
      onTap: this.onPressed,
      child: Stack(
        children: <Widget>[
          _LargeButtonBackground(
            icon: this.icon,
            firstColor: this.firstColor, 
            secondaryColor: this.secondaryColor
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100.0, width: 40.0),
              FaIcon(this.icon, color: Colors.white, size: 40.0),
              SizedBox(width: 25.0),
              Expanded(child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18.0))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40.0)
            ],
          )
        ],
      ),
    );
  }
}

class _LargeButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color firstColor;
  final Color secondaryColor;

  _LargeButtonBackground({this.icon, this.firstColor, this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon, color: Colors.white.withOpacity(0.2), size: 150.0)
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            offset: Offset(4,6),
          )
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: <Color> [
            this.firstColor,
            this.secondaryColor,
          ]
        ),
      ),
    );
  }
}