import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:music_player/src/themes/theme.dart';

import 'package:music_player/src/pages/music_player_page.dart';

import 'package:music_player/src/models/audio_player_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AudioPlayerModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: MusicPlayerPage(),
        theme: myTheme,
      ),
    );
  }
}
