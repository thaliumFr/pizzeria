import 'package:flutter/material.dart';
import 'package:pizzeria/models/Cart.dart';
import 'package:pizzeria/models/menu.dart';

import 'package:pizzeria/ui/pizza_list.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Pizzéria",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: "Notre Pizzéria"));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Cart _cart;

  MyHomePage({required this.title, super.key}) : _cart = Cart();

  final _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title, _cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch (_menus[index].type) {
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PizzaList(_cart)));
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
