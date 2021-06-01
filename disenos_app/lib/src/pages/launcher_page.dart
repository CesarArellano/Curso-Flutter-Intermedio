import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs'),
      ),
      drawer: _MainMenu(),
      body: _OptionsList()
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.blue,
                  child: Text('CA', style: TextStyle(fontSize: 50),),
                )
              ),
            ),
            Expanded(
              child: _OptionsList()
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true, 
                onChanged: (value) {

                }
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
              title: Text('Custome Theme'),
              trailing: Switch.adaptive(
                value: true, 
                onChanged: (value) {
                }
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
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(  
        leading: FaIcon(pageRoutes[i].icon, color: Colors.blue),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => pageRoutes[i].page));
        },
      )
    );
  }
}