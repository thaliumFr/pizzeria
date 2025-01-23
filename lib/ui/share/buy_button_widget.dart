import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/pizza.dart';

class BuyButtonWidget extends StatelessWidget {
  final Pizza _pizza;
  final Cart _cart;

  const BuyButtonWidget(this._pizza, this._cart, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            _cart.showCart();
            _cart.addProduct(_pizza);
          },
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red.shade800)),
          child: const Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 5),
              Text("Commander")
            ],
          ),
        )
      ],
    );
  }
}
