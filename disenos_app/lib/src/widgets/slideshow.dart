import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool upDots;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  
  SlideShow({
    @required this.slides,
    this.upDots = false,
    this.primaryBullet = 12,
    this.secondaryBullet = 12,    
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SlideShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<SlideShowModel>(context).primaryColor = this.primaryColor;
              Provider.of<SlideShowModel>(context).secondaryColor = this.secondaryColor;
              Provider.of<SlideShowModel>(context).primaryBullet = this.primaryBullet;
              Provider.of<SlideShowModel>(context).secondaryBullet = this.secondaryBullet;
              return StructureSlideShow(upDots: upDots, slides: slides);
            }            
          ),
        )
      )
    );
  }
}

class StructureSlideShow extends StatelessWidget {
  final bool upDots;
  final List<Widget> slides;

  StructureSlideShow({
    @required this.upDots,
    @required this.slides,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.upDots) _Dots(totalSlides: this.slides.length),
        Expanded(child: _Slides(slides)),
        if (!this.upDots) _Dots(totalSlides: this.slides.length),
      ],
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
      Provider.of<SlideShowModel>(context, listen: false).currentPage = pageViewController.page;
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
    final ssModel = Provider.of<SlideShowModel>(context);
    double size;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      size = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      size = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),      
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
    );
  }
}

class SlideShowModel with ChangeNotifier{
  double _currentPage = 0;
  double _primaryBullet = 15;
  double _secondaryBullet = 12;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double primaryBullet) {
    this._primaryBullet = primaryBullet;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double secondaryBullet) {
    this._secondaryBullet = secondaryBullet;
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
  }
}