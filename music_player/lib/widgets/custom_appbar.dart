import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: <Widget>[
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 50.0,
                child: FaIcon(FontAwesomeIcons.chevronLeft)
              )
            ),
            Spacer(),
            FaIcon(FontAwesomeIcons.commentAlt),
            SizedBox(width: 20.0),
            FaIcon(FontAwesomeIcons.headphonesAlt),
            SizedBox(width: 20.0),
            FaIcon(FontAwesomeIcons.externalLinkAlt),            
          ],
        )
      ),
    );
  }
}