import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:disenos_app/src/widgets/large_button.dart';


class ItemButton {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;

  ItemButton(this.icon, this.text, this.primaryColor, this.secondaryColor);
}

class EmergencyPage extends StatelessWidget {
  final items = <ItemButton>[
    new ItemButton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemButton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemButton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemButton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemButton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemButton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    new ItemButton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    new ItemButton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    new ItemButton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  ];

  @override
  Widget build(BuildContext context) {
    bool _isLarge;
    if ( MediaQuery.of(context).size.height > 500 ) {
      _isLarge = true;
    } else {
      _isLarge = false;
    }

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        duration: Duration(milliseconds: 450),
        child: Container(
          padding: EdgeInsets.only(bottom: 25.0),
          child: LargeButtonTemp(
            icon: item.icon,
            text: item.text,
            primaryColor: item.primaryColor,
            secondaryColor: item.secondaryColor
          ),
        ),
      )
    ).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: (_isLarge) ? 225 : 10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget> [
                SizedBox(height: (_isLarge) ? 80 : 20),
                ...itemMap
              ]
            ),
          ),
          if( _isLarge ) Header(),
        ],
      )
    );
  }
}

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Médica',
          subtitle: 'Haz solicitado',
          firstColor: Color(0xff526BF6),
          secondaryColor: Color(0xff67ACF2),
        ),
        Positioned(
          top: 60,
          right: 0,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)
          )
        )
      ],
    );
  }
}

class LargeButtonTemp extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;

  LargeButtonTemp({this.icon, this.text, this.primaryColor, this.secondaryColor});
  
  @override
  Widget build(BuildContext context) {
    return LargeButton(
      icon: this.icon,
      text: this.text,
      firstColor: this.primaryColor,
      secondaryColor: this.secondaryColor,
      onPressed: () {
        print('Hola jeje');
      },
    );
  }
}