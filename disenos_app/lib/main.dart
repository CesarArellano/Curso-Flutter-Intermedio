import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new ThemeChanger(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LauncherPage(),
      ),
    );
  }
}