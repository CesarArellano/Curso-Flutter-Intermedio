import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class RoundedBorderHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,      
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    
    // Properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stoke
    pencil.strokeWidth = 2.0;

    final path = Path();

    // Draw with the path and the pencil
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  
  }
}

class TriangularHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _TriangularHeaderPainter(),
      ),
    );
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    
    // Properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stoke
    pencil.strokeWidth = 2.0;

    final path = Path();

    // Draw with the path and the pencil
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  
  }
}

class PeakHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    
    // Properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stoke
    pencil.strokeWidth = 2.0;

    final path = Path();

    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  
  }

}

class CurvedHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _CurvedHeaderPainter(),
      ),
    );
  }
}

class _CurvedHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    
    // Properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stoke
    pencil.strokeWidth = 2.0;

    final path = Path();

    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  
  }

}

class WavesHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _WavesHeaderPainter(),
      ),
    );
  }
}

class _WavesHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    
    // Properties
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; // .stoke
    pencil.strokeWidth = 2.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  
  }

}

class GradienteWavesHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _GradientHeaderPainter(),
      ),
    );
  }
}

class _GradientHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0.0),
      radius: 200.0
    );
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ]
    );
    final pencil = Paint()..shader = gradient.createShader(rect);
    
    // Properties
    pencil.style = PaintingStyle.fill; // .stoke
    pencil.strokeWidth = 2.0;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  
  }

}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color firstColor;
  final Color secondaryColor;

  IconHeader({ 
    @required this.icon, 
    @required this.title,
    @required this.subtitle,
    this.firstColor = Colors.grey, 
    this.secondaryColor = Colors.blueGrey
  });
  
  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.15);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(firstColor: this.firstColor, secondaryColor: this.secondaryColor),
        Positioned(
          top: -50.0,
          left: -70.0,
          child: FaIcon(this.icon, color: whiteColor, size: 250),
        ),
        Column(          
          children: <Widget>[
            SizedBox(height: 80.0, width: double.infinity),
            Text(this.subtitle, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7))),
            SizedBox(height: 20.0),
            Text(this.title, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
            FaIcon(this.icon, color: Colors.white, size: 80),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color firstColor;
  final Color secondaryColor;

  _IconHeaderBackground({this.firstColor, this.secondaryColor});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,      
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            this.firstColor,
            this.secondaryColor
          ],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))
      ),
    );
  }
}
