import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Widgets
import 'package:disenos_app/src/widgets/slideshow.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MySlideShow()),
          Expanded(child: MySlideShow()),
        ],
      )
    );
  }
}

class MySlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideShow(
      primaryBullet: 15,
      upDots: false,
      primaryColor: Color(0xffFF5A7E),
      secondaryColor: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}