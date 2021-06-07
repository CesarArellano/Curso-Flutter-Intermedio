import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShoeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes App',
        home: ShoePage()
      ),
    );
  }
}