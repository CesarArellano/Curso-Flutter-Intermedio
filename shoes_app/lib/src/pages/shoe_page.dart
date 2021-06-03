import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(text: 'For you'),
          SizedBox(height: 20.0),
          ShoeSizePreview(),
        ],
      )
    );
  }
}