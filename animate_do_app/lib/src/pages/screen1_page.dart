import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do_app/src/pages/twitter_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class Screen1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: FadeIn(
          delay: Duration(milliseconds: 500),
          child: Text('Animate Do')
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => TwitterPage()));
            },
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 50,
            child: IconButton(
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (_) => Screen1Page()));
              },
              icon: Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Titulo', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200))
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400))
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue
              ),
            )
          ],
        ),
      ),

      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {},
        ),
      ),
    );
  }
}