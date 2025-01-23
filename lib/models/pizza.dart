import 'package:pizzeria/models/option_item.dart';

class Pizza {
  final int id;
  final String title, garniture, image;
  final double price;

  int pate = 0, taille = 0, sauce = 0;

  double get total {
    double total = price;

    total += pates[pate].supplement;
    total += tailles[taille].supplement;
    total += sauces[sauce].supplement;

    return total;
  }

  static final List<OptionItem> pates = [
    OptionItem(0, "Pâte fine"),
    OptionItem(1, "Pâte épaisse", supplement: 2)
  ];

  static final List<OptionItem> tailles = [
    OptionItem(0, "Small", supplement: -1),
    OptionItem(
      1,
      "Medium",
    ),
    OptionItem(2, "Large", supplement: 2),
    OptionItem(0, "Extra large", supplement: 4),
  ];

  static final List<OptionItem> sauces = [
    OptionItem(0, "Base sauce tomato"),
    OptionItem(1, "Sauce maison", supplement: 2)
  ];

  @override
  bool operator ==(dynamic other) {
    if (other is! Pizza) return false;
    if (id != other.id) return false;
    if (title != other.title) return false;
    if (pate != other.pate) return false;
    if (sauce != other.sauce) return false;
    if (taille != other.taille) return false;
    if (hashCode != other.hashCode) return false;
    return true;
  }

  @override
  int get hashCode {
    var result = id;
    result += pate * 10;
    result += taille * 100;
    result += sauce * 1000;
    return result;
  }

  Pizza(this.id, this.title, this.garniture, this.image, this.price);
  Pizza.clone(Pizza pizza)
      : id = pizza.id,
        title = pizza.title,
        garniture = pizza.garniture,
        image = pizza.image,
        price = pizza.price,
        pate = pizza.pate,
        taille = pizza.taille,
        sauce = pizza.sauce;

  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        garniture = json['garniture'],
        image = json['image'],
        price = json['price'];
}
