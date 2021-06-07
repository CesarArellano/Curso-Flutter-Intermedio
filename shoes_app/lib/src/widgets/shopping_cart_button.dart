import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoppingCartButton extends StatelessWidget {
  final double amount;

  ShoppingCartButton({this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20.0),
            Text('\$$amount', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            OrangeButton(text: 'Add to cart'),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}
