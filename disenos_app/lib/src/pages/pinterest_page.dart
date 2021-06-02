import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PinterestGrid(),
            PinterestBottomMenu(),          
          ],
        )
      ),
    );
  }
}

class PinterestBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context);
    
    return Positioned(
      bottom: 30,
      child: Container(
        width: screenWidth,
        child: Row(
          children: [
            Spacer(),
            PinterestMenu(
              show: show,
              backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
              activeColor: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Colors.black,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () { print('Icon pie_chart'); }),
                PinterestButton(icon: Icons.search, onPressed: () { print('Icon search'); }),
                PinterestButton(icon: Icons.notifications, onPressed: () { print('Icon notifications'); }),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('Icon supervised_user_circle'); }),
              ],
            ),
            Spacer(),
          ],
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  
  final List items = List.generate(200, (i) => i);
  ScrollController _scrollController = new ScrollController();
  double lastScroll = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if( _scrollController.offset > 150 && _scrollController.offset > lastScroll ) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      lastScroll = _scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if ( MediaQuery.of(context).size.width > 500 ) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
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

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show( bool value ) {
    this._show = value;
    notifyListeners();
  }
}
