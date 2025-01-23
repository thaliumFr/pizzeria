import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/badge_widget.dart';

class BottomNavbarWidget extends StatelessWidget {
  final int indexSelected;
  final Cart cart;

  const BottomNavbarWidget(this.indexSelected, this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    int totalItems = cart.totalItems();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indexSelected,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Acceuil"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined), label: "Commande"),
        BottomNavigationBarItem(
          icon: totalItems == 0
              ? Icon(Icons.shopping_cart_outlined)
              : BadgeWidget(
                  value: totalItems,
                  top: 0,
                  right: 0,
                  child: Icon(Icons.shopping_cart_outlined),
                ),
          label: "Panier",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
      onTap: (index) {
        String page = "/";
        switch (index) {
          case 2:
            page = "/panier";
            break;
          case 3:
            page = "/profil";
            break;
        }
        Navigator.pushNamed(context, page);
      },
    );
  }
}
