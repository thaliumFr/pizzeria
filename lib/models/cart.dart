import 'package:flutter/material.dart';
import 'package:pizzeria/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  Cart();

  int totalItems() => _items.length;
  CartItem getCartItem(int index) => _items[index];

  int findCartItemIndex(int id) {
    return _items.indexWhere((el) => el.pizza.id == id);
  }

  void addProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);

    if (index == -1) {
      _items.add(CartItem(pizza));
    } else {
      _items[index].quantity++;
    }
    notifyListeners();
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);

    if (index != -1) {
      CartItem item = _items[index];

      if (--item.quantity == 0) {
        _items.removeAt(index);
      }
    }
    notifyListeners();
  }

  double prixTotal() {
    double res = 0;

    for (var item in _items) {
      res += item.pizza.total * item.quantity;
    }

    return res;
  }
}
