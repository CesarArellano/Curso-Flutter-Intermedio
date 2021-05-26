import 'package:flutter/material.dart';

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
            Color(0xff526BF6),
            Color(0xff67ACF2)
          ],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))
      ),
    );
  }
}
