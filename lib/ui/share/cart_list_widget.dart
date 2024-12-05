import 'package:flutter/material.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import 'package:pizzeria/models/cart.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    Cart cart = context.watch<Cart>();
    return Text(cart.totalItems().toString());
    /*ListView.builder(
      itemCount: cart.totalItems(),
      itemBuilder: (context, index) => _buildCartItems(cart, index),
    );*/
  }

  _buildCartItems(Cart cart, int index) {
    CartItem item = cart.getCartItem(index);
    return Row(
      children: [
        Image.network(
          item.pizza.image,
          height: 180,
        ),
        Column(
          children: [
            Text(
              item.pizza.title,
              style: PizzeriaStyle.headerTextStyle,
            ),
            Row(
              children: [
                Text(
                  '${item.pizza.total} €',
                  style: PizzeriaStyle.subPriceTotalTextStyle,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cart.removeProduct(item.pizza);
                        print("${item.quantity}");
                      },
                    ),
                    Text('${item.quantity}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cart.addProduct(item.pizza);
                        print("${item.quantity}");
                      },
                    ),
                  ],
                )
              ],
            ),
            Text(
              'Sous-Total: ${item.quantity * item.pizza.total} €',
              style: PizzeriaStyle.priceTotalTextStyle,
            )
          ],
        )
      ],
    );
  }
}
