import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenos_app/src/models/slider_model.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        )
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();
  
  @override
  void initState() { 
    super.initState();
    pageViewController.addListener(() {
      // Updating currentPage value
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });
  }
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        _Slide(svg: 'assets/svgs/slide-1.svg'),
        _Slide(svg: 'assets/svgs/slide-2.svg'),
        _Slide(svg: 'assets/svgs/slide-3.svg'),
        _Slide(svg: 'assets/svgs/slide-4.svg'),
        _Slide(svg: 'assets/svgs/slide-5.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  _Slide({this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
          _Dot(index: 3),
          _Dot(index: 4),
        ],
      )
    );
  }
  
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot({ this.index });
  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (pageViewIndex == index) ? Colors.blue : Colors.grey
      ),
    );
  }
}