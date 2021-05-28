import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NavigationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Notifications Page'),
      ),
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: BottomNavigation(),
      
    );
  }
}

class BottomNavigation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      elevation: 20,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon( FontAwesomeIcons.bone )
        ),
        BottomNavigationBarItem(
          label: 'Notificacions',
          icon: Stack(
            children: <Widget>[
              FaIcon( FontAwesomeIcons.bell ),
              Positioned(
                right: 0,
                child: Container(
                  child: Text('1', style: TextStyle(color: Colors.white, fontSize: 6),),
                  alignment: Alignment.center,
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle
                  ),
                )
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon( FontAwesomeIcons.dog )
        ),
      ],
    );
  }
}

class FloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: (){},
    );
  }
}