import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/theme/theme.dart';

class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _NewButtonList(),
          )
        ]
      )
    );
  }
}

class _NewButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      width: size.width * 0.9,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),
          primary: ( appTheme.darkTheme ) ? appTheme.currentTheme.accentColor : Color(0xffED6762),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
          )
        ),
        onPressed: () {},
        child: Text('CREATE NEW LIST', style: TextStyle(color: appTheme.currentTheme.scaffoldBackgroundColor ))
      )
    );
  }

}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Colors.pinkAccent ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget> [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 190,
            maxHeight: 200,
            child: Card(  
              elevation: 3,
              margin: EdgeInsets.zero,
              color: appTheme.scaffoldBackgroundColor,
              child: _Title(),
            )
          )
        ),
        SliverList(         
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return  maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minHeight ||
            child != oldDelegate.child;
  }
  
}

class _Title extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        SizedBox(height: 65.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text('New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128), 
              fontSize: 50
            )
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5)
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

class _ListItem extends StatelessWidget {
  
  final String text;
  final Color color;

  _ListItem(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Container(
      alignment: Alignment.center,
      child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.deepPurple : this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}