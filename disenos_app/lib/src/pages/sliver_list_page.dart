import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _TaskList()
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 50.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 50),),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5)
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold ))
            ),            
          ],
        )
      ],
    );
  }
}

class _TaskList extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Colors.pinkAccent ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {
  
  final String text;
  final Color color;

  _ListItem(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}