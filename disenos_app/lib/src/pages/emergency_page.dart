import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconHeader(
            icon: FontAwesomeIcons.plus,
            title: 'Asistencia Médica',
            subtitle: 'Haz solicitado',
            firstColor: Color(0xff526BF6),
            secondaryColor: Color(0xff67ACF2),
          )
        ],
      )
    );
  }
}