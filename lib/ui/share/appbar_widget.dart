import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/panier.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Cart _cart;

  const AppbarWidget(this.title, this._cart, {super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Panier(_cart),
                  ));
            },
            icon: Icon(Icons.shopping_cart))
      ],
    );
  }
}
