import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class PieChartsPage extends StatefulWidget {
  @override
  _PieChartsPageState createState() => _PieChartsPageState();
}

class _PieChartsPageState extends State<PieChartsPage> {
  
  double percentage = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(  
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(percentage: percentage, color: Colors.blue),
              CustomRadialProgress(percentage: percentage, color: Colors.red)
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(percentage: percentage, color: Colors.green),
              CustomRadialProgress(percentage: percentage, color: Colors.purple)
            ],
          ),
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double percentage;
  final Color color;

  CustomRadialProgress({ @required this.percentage, @required this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        percentage: percentage, 
        primaryColor: color,
        primaryThickness: 8.0,
      )
    );
  }
}