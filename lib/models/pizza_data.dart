import 'package:pizzeria/models/pizza.dart';

class PizzaData {
  static List<Pizza> buildList() {
    List<Pizza> list = [
      Pizza(1, "Barbucue", "La garniture", 'pizza-bbq.jpg', 8),
      Pizza(2, "Hawai", "Team Ananas", 'pizza-bbq.jpg', 9),
      Pizza(3, "Végétarienne", "De l'herbe", 'pizza-bbq.jpg', 7),
      Pizza(4, "Epinards", "De l'herbe mais encore moins bon", 'pizza-bbq.jpg',
          10),
    ];

    return list;
  }
}
