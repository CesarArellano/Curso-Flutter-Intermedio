import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavigationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
        
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<_NotificationModel>(context).number;
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
              if (number > 0 ) _NotificationsContainer(number: number)
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

class _NotificationsContainer extends StatelessWidget {
  final int number;

  _NotificationsContainer({
    @required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Bounce(
        controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
        from: 10,
        child: Container(
          child: Text('$number', style: TextStyle(color: Colors.white, fontSize: 6)),
          alignment: Alignment.center,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle
          ),
        ),
      )
    );
  }
}

class FloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notiModel = Provider.of<_NotificationModel>(context, listen: false); 
        int number = notiModel.number;
        number++;
        notiModel.number = number; 
        if(number >= 2) {
          final controller =notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}
class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController _bounceController;

  int get number => this._number;

  set number(int value) {
    this._number = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }

}