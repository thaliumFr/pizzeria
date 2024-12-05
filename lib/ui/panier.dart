import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/bottom_navbar_widget.dart';
import 'package:pizzeria/ui/share/cart_list_widget.dart';
import 'package:pizzeria/ui/share/cart_total_widget.dart';
import 'package:provider/provider.dart';

class Panier extends StatelessWidget {
  const Panier({super.key});

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CartList(),
            ),
          ),
          CartTotal()
        ],
      ),
    );
  }
}
