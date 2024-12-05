import 'package:flutter/material.dart';
import 'package:pizzeria/models/Cart.dart';
import 'package:pizzeria/models/menu.dart';
import 'package:pizzeria/models/pizza.dart';
import 'package:pizzeria/ui/panier.dart';
import 'package:pizzeria/ui/share/bottom_navbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:pizzeria/ui/pizza_list.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';

void main() {
  runApp(MainApp());
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: MainApp(),
//     ),
//   );
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizzéria",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Notre Pizzéria"),
      routes: {
        '/profil': (context) => Panier(),
        '/panier': (context) => Panier(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({required this.title, super.key});

  final _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue)
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (_) => Cart(),
      child: Consumer<Cart>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppbarWidget(title),
          body: Text("cart.totalItems().toString()"),
          bottomNavigationBar: BottomNavbarWidget(2),
          /*Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch (_menus[index].type) {
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PizzaList()));
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PizzaList()));
                  break;
                default:
              }
            },
            child: _buildRow(_menus[index]),
          ),
          itemExtent: 180,
        ),
      ),*/
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
