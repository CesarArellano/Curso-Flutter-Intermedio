import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/helpers/helpers.dart';

import 'package:music_player/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            children: <Widget>[
              CustomAppBar(),
              DurationDiskImage(),
              TitlePlay(),
              SizedBox(height: 50.0),
              Expanded(
                child: Lyrics()
              )
            ],
          ),
        ],
      )
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: <Color>[
            Color(0xff33333E),
            Color(0xff201E28),
          ]
        )
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> lyrics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 1.5,
        children: lyrics.map(
          (line) => Text(line, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.6)))
        ).toList(),
      ),
    );
  }
}

class TitlePlay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      margin: EdgeInsets.only(top: 30.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 60.0),
          Column(
            children: <Widget>[
              Text('Óleos', style: TextStyle(fontSize: 30.0, color: Colors.white.withOpacity(0.8))),
              Text('Camilo Séptimo', style: TextStyle(fontSize: 15.0, color: Colors.white.withOpacity(0.5))),        
            ]
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xffF8CB51),
            onPressed: (){},
            child: FaIcon(FontAwesomeIcons.play),
          )
        ],
      ),
    );
  }
}
class DurationDiskImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 75.0),
      child: Row(
        children: <Widget>[
          DiskImage(),
          SizedBox(width: 50.0),
          MusicProgressBar()
        ],
      ),
    );
  }
}

class MusicProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    final styleText = TextStyle(color: Colors.white.withOpacity(0.4));

    return Column(
      children: <Widget>[
        Text('04:30', style: styleText),
        SizedBox(height: 20.0),
        Stack(
          children: <Widget>[
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 100,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Text('00:00', style: styleText)
      ],
    );
  }
}

class DiskImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset('assets/oleos.jpg'),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                
                color: Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: <Color>[
            Color(0xff484750),
            Color(0xff1E1C24)
          ]
        )
      ),
    );
  }
}