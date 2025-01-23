import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/menu.dart';
import 'package:pizzeria/ui/panier.dart';

import 'package:pizzeria/ui/pizza_list.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';
import 'package:pizzeria/ui/share/bottom_navbar_widget.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Cart _cart;

  MainApp({super.key}) : _cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizzéria",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: "Notre Pizzéria",
        cart: _cart,
      ),
      routes: {
        '/profil': (context) => Panier(_cart),
        '/panier': (context) => Panier(_cart),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Cart cart;

  MyHomePage({required this.title, required this.cart, super.key});

  final _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title, cart),
      bottomNavigationBar: BottomNavbarWidget(0, cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch (_menus[index].type) {
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PizzaList(cart)));
                  break;
                default:
              }
            },
            child: _buildRow(_menus[index]),
          ),
          itemExtent: 180,
        ),
      ),
    );
  }
}

_buildRow(Menu menu) {
  return Container(
    height: 180,
    decoration: BoxDecoration(
        color: menu.color,
        borderRadius: const BorderRadius.all(Radius.circular(20))),
    margin: const EdgeInsets.all(4),
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/menus/${menu.image}',
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: Text(
              menu.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 28),
            ),
          ),
        )
      ],
    ),
  );
}
