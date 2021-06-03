import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audio_player_model.dart';
import 'package:music_player/src/widgets/custom_app_bar.dart';

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
              Expanded(child: Lyrics())
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
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff33333E),
            Color(0xff201E28)
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
      margin: EdgeInsets.only(top: 30.0),
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 42,        
        diameterRatio: 1.5,
        children: lyrics.map(
          (line) => Text(line, style: TextStyle(fontSize: 20.0, color: Colors.white.withOpacity(0.6)))
        ).toList(),
      ),
    );
  }
}

class TitlePlay extends StatefulWidget {
  @override
  _TitlePlayState createState() => _TitlePlayState();
}

class _TitlePlayState extends State<TitlePlay> with SingleTickerProviderStateMixin{
  bool isPlaying = false;
  bool firstTime = true;
  AnimationController playAnimation;
  final assetAudioPlayer = new AssetsAudioPlayer();

  @override
  void initState() { 
    playAnimation = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
    
  }

  @override
  void dispose() { 
    playAnimation.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
    
    assetAudioPlayer.open(Audio('assets/oleos.mp3'));
    
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
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 60.0),
          Column(
            children: <Widget>[
              Text('Óleos', style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text('Camilo Séptimo', style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.5)))
            ],
          ),
          Spacer(),
          FloatingActionButton(
            backgroundColor: Color(0xffF8CB51),
            child: AnimatedIcon(
              progress: playAnimation,
              icon: AnimatedIcons.play_pause,
            ),
            onPressed: () {
              final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
              if ( isPlaying ) {
                playAnimation.reverse();
                isPlaying = false;
                audioPlayerModel.controller.stop();
              } else {  
                playAnimation.forward();
                isPlaying = true;
                audioPlayerModel.controller.repeat();
              }

              if (firstTime) {
                this.open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
          ),
          SizedBox(width: 5.0)
        ],
      )
    );
  }
}

class DurationDiskImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(top: 75.0),
      child: Row(
        children: <Widget>[
          DiskImage(),
          SizedBox(width: 40.0),
          MusicProgressBar()
        ],
      ),
    );
  }
}

class MusicProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final percentage = audioPlayerModel.percentage;

    return Column(
      children: <Widget>[
        Text('${ audioPlayerModel.songTotalDuration }'),
        SizedBox(height: 10.0),
        Stack(
          children: <Widget>[
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1)
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230 * percentage,
                color: Colors.white.withOpacity(0.8)
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text('${ audioPlayerModel.currentSecond }'),
      ],
    );
  }
}

class DiskImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(125);
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(20.0),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(          
          colors: <Color> [
            Color(0xff484750),
            Color(0xff1E1C24)
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SpinPerfect(
              animate: false,
              duration: Duration(seconds: 10),
              infinite: true,
              controller: (animationController) {  
                audioPlayerModel.controller = animationController;
              },
              child: Image.asset('assets/oleos.jpg')
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.black38
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Color(0xff1C1C25)
              ),
            ),
          ],
        )
      )
    );
  }
}