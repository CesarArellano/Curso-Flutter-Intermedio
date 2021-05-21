import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:disenos_app/src/models/slider_model.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  
  SlideShow({
    @required this.slides
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Center(
        child: Column(
          children: [
            Expanded(child: _Slides(slides)),
            _Dots(totalSlides: this.slides.length),
          ],
        ),
      )
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  
  _Slides(this.slides);

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
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  _Dots({this.totalSlides});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index: index))
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),      
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) 
          ? Colors.blue 
          : Colors.grey
      ),
    );
  }
}