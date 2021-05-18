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
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: RadialProgress(percentage: 40.0)
        )
      ),
    );
  }
}