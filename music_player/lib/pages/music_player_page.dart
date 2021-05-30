import 'package:flutter/material.dart';

import 'package:music_player/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          DurationDiskImage()
        ],
      )
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