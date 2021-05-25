import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PinterestGrid(),
          PinterestBottomMenu(),          
        ],
      )
    );
  }
}

class PinterestBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Positioned(
      bottom: 30,
      child: Container(
        width: screenWidth,
        child: Align(
          child: PinterestMenu(),
        )
      )
    );
  }
}

class PinterestGrid extends StatelessWidget {
  final List items = List.generate(200, (i) => i);
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PinterestItem extends StatelessWidget {
  
  final int index;

  PinterestItem(
    this.index
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      )
    );
  }
}