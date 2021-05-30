import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/models/audioplayer_model.dart';

import 'package:music_player/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

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

class TitlePlay extends StatefulWidget {
  
  @override
  _TitlePlayState createState() => _TitlePlayState();
}

class _TitlePlayState extends State<TitlePlay> with SingleTickerProviderStateMixin {
  
  bool isPlaying = false;
  bool firstTime = true;
  AnimationController playAnimation;

  final assetAudioPlayer = new AssetsAudioPlayer();
  @override
  void initState() {
    playAnimation = new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    assetAudioPlayer.open(Audio('assets/Camilo-Séptimo-Óleos.mp3'));
    
    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration = playingAudio.audio.duration;
    });
  }
  
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
            backgroundColor: Color(0xffF8CB51),
            onPressed: () {
              final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
              if ( this.isPlaying ) {
                playAnimation.reverse();
                this.isPlaying = false;
                audioPlayerModel.controller.stop();
              } else {
                playAnimation.forward();
                this.isPlaying = true;
                audioPlayerModel.controller.repeat();
              }

              if (firstTime) {
                this.open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
            child: AnimatedIcon(              progress: playAnimation,
              icon: AnimatedIcons.play_pause
              
            ),
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
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final percentage = audioPlayerModel.percentage;

    return Column(
      children: <Widget>[
        Text('${audioPlayerModel.songTotalDuration}', style: styleText),
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
                height: 230 * percentage,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Text('${audioPlayerModel.currentSecond}', style: styleText)
      ],
    );
  }
}

class DiskImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SpinPerfect(
              duration: Duration( seconds: 10 ),
              infinite: true,
              manualTrigger: true,
              controller: ( animationController) => audioPlayerModel.controller = animationController,
              child: Image.asset('assets/oleos.jpg')
            ),
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