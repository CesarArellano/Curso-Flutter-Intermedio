import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs'),
        backgroundColor: appTheme.accentColor,
      ),
      drawer: _MainMenu(),
      body: _OptionsList()
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text('CA', style: TextStyle(fontSize: 50),),
                )
              ),
            ),
            Expanded(
              child: _OptionsList()
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: appTheme.currentTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme, 
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: appTheme.currentTheme.accentColor),
                title: Text('Custome Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme, 
                  onChanged: (value) => appTheme.customTheme = value
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(  
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => pageRoutes[i].page));
        },
      )
    );
  }
}