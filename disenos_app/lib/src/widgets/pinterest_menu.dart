import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  
  PinterestButton({
    @required this.onPressed,
    @required this.icon
  });
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.show = true,
    @required this.items, 
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.black
  });
    
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: ( show ) ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: _PinterestMenuBackground(          
          child: _MenuItems(
            menuItems: items,
            activeColor: activeColor
          ),
          backgroundColor: backgroundColor,  
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  _PinterestMenuBackground({ this.child, this.backgroundColor });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:  BorderRadius.circular(100),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final Color activeColor;
  final List<PinterestButton> menuItems;
  
  _MenuItems({ this.menuItems, this.activeColor });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i], activeColor))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final Color activeColor;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item, this.activeColor);

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon, 
          size: (selectedItem == index) ? 30.0 : 25.0, 
          color: (selectedItem == index) ? activeColor : Colors.grey
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;

  int get selectedItem => this._selectedItem;

  set selectedItem( int index ) {
    this._selectedItem = index;
    notifyListeners();
  }
}
