import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pizzeria/models/Cart.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final format = NumberFormat("###.##€");

  @override
  Widget build(BuildContext context) {
    Cart cart = context.watch<Cart>();

    return Column(
      children: [
        Table(
          children: [
            TableRow(children: [
              Container(
                padding: EdgeInsets.only(left: 50),
              ),
              Text("TOTAL HT"),
              Text(format.format(cart.prixTotal()))
            ]),
            TableRow(children: [
              Container(
                padding: EdgeInsets.only(left: 50),
              ),
              Text("TVA"),
              Text(format.format(cart.prixTotal() * 0.1))
            ]),
            TableRow(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 50),
                ),
                Text("TOTAL TTC"),
                Text(format.format(cart.prixTotal() * 1.1))
              ],
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            print("Clear");
          },
          child: Text('Valider'),
        ),
      ],
    );
  }
}
