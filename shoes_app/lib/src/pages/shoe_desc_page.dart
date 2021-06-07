import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ShoeSizePreview(fullScreen: true),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _AmountBuyNow(),
                _ColorsAndMore()
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class _ColorsAndMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(left: 90, child: _ColorButton(color: Color(0xff2099F1))),
                Positioned(left: 60, child: _ColorButton(color: Color(0xffFFAD29))),
                Positioned(left: 30, child: _ColorButton(color: Color(0xffC6D642))),
                _ColorButton(color: Color(0xff364D56)),
              ],
            ),
          ),
          OrangeButton(text: 'More related items', height: 30, width: 170, color: Color(0xffFFC675))
        ],
      )
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;

  _ColorButton({ this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Row(
        children: <Widget>[
          Text('\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Spacer(),
          OrangeButton(text: 'Buy Now', width: 120, height: 40)
        ],
      ),
    );
  }
}
