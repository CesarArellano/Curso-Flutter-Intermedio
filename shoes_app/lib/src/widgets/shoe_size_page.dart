import 'package:flutter/material.dart';
import 'package:shoes_app/src/pages/shoe_desc_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;
  ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ShoeDescPage()));
        }
      },
      child: Padding(
        padding: (this.fullScreen) 
        ? EdgeInsets.zero 
        : EdgeInsets.symmetric( horizontal: 30, vertical: 5.0),
        child: Container(
          width: double.infinity,
          height: 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: (!this.fullScreen) 
              ? BorderRadius.circular(50)
              : BorderRadius.vertical(bottom: Radius.circular(60.0))
          ),
          child: Column(
            children: <Widget>[
              _ShoeWithShadow(),
              if (!fullScreen) _ShowSizes()
            ]
          )
        ),
      ),
    );
  }
}

class _ShowSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _ShoeSizeBox(number: 7),
          _ShoeSizeBox(number: 7.5),
          _ShoeSizeBox(number: 8),
          _ShoeSizeBox(number: 8.5),
          _ShoeSizeBox(number: 9),
          _ShoeSizeBox(number: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double number;

  _ShoeSizeBox({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      child: Text('${number.toString().replaceAll('.0', '')}',
          style: TextStyle(
              color: (this.number == 9) ? Colors.white : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold)),
      decoration: BoxDecoration(
          color: (this.number == 9) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            if (this.number == 9)
              BoxShadow(
                  color: Color(0xffF1A23A),
                  blurRadius: 10.0,
                  offset: Offset(0, 5))
          ]),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          _ShoeShadow(),
          Image.asset('assets/imgs/azul.png'),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          width: 230,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: <BoxShadow>[
                BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)
              ]),
        ),
      ),
    );
  }
}
