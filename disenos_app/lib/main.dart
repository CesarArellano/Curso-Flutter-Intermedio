import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(2),
      child: MyApp()
    )    
  ); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          print('Print: $orientation');
          
          return Container(
            child: LauncherPage(),
          );
        },
      ),
    );
  }
}