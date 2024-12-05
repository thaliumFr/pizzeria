import 'package:flutter/material.dart';
import 'package:pizzeria/models/Cart.dart';
import 'package:pizzeria/models/pizza.dart';
import 'package:provider/provider.dart';

class BuyButtonWidget extends StatelessWidget {
  final Pizza _pizza;

  const BuyButtonWidget(this._pizza, {super.key});

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            print('commander pizza');
            cart.addProduct(_pizza);
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
