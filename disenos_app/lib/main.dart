import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ThemeChanger(2)),
        ChangeNotifierProvider(create: (_) => new LayoutModel()),
      ],      
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
          // print('Print: $orientation');

          // return Container(
          //   child: LauncherPage(),
          // );
          final screenSize = MediaQuery.of(context).size;
          
          if(screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
          
        },
      ),
    );
  }
}