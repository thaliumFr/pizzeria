import 'package:flutter/material.dart';
import 'package:pizzeria/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart {
  final List<CartItem> _items = [];

  int totalItems() => _items.length;
  CartItem getCartItem(int index) => _items[index];

  int findCartItemIndex(Pizza pizza) {
    debugPrint("testing ${pizza.hashCode}");
    int i = 0;
    for (var el in _items) {
      debugPrint("- found ${el.pizza.hashCode}");
      if (el.pizza == pizza) {
        return i;
      }
      i++;
    }

    return -1;
  }

  void addProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza);

    if (index == -1) {
      _items.add(CartItem(Pizza.clone(pizza)));
      debugPrint("adding new cart item: ${pizza.hashCode}");
    } else {
      _items[index].quantity++;
      debugPrint("incrementing pizza ${_items[index].pizza.hashCode}");
    }
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza);

    if (index != -1) {
      CartItem item = _items[index];

      if (--item.quantity <= 0) {
        _items.removeAt(index);
      }
    }
  }

  void showCart() {
    debugPrint("CART INVENTORY");
    for (var el in _items) {
      debugPrint("- ${el.pizza.hashCode} x ${el.quantity}");
    }
  }

  double prixTotal() {
    double res = 0;

    for (var item in _items) {
      res += item.pizza.total * item.quantity;
    }

    return res;
  }
}
