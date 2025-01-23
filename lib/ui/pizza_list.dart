import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/models/pizza.dart';
import 'package:pizzeria/services/pizzeria_service.dart';
import 'package:pizzeria/ui/pizza_details.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';
import 'package:pizzeria/ui/share/bottom_navbar_widget.dart';
import 'package:pizzeria/ui/share/buy_button_widget.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class PizzaList extends StatefulWidget {
  final Cart _cart;

  const PizzaList(this._cart, {super.key});

  @override
  State<PizzaList> createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  late Future<List<Pizza>> _pizzas;
  final PizzeriaService _service = PizzeriaService();

  @override
  void initState() {
    super.initState();
    _pizzas = _service.fetchPizzas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget("Pizza list", widget._cart),
      bottomNavigationBar: BottomNavbarWidget(0, widget._cart),
      body: FutureBuilder(
        future: _pizzas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildListView(snapshot.data!);
          } else {
            return Center(
              child: Text(
                "impossible de récupérer les données: ${snapshot.error}",
                style: PizzeriaStyle.errorTextStyle,
              ),
            );
          }
        },
      ),
    );
  }

  _buildListView(List<Pizza> pizzas) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pizzas.length,
      itemBuilder: (context, index) => _buildRow(pizzas[index]),
    );
  }

  _buildPizzaDetails(Pizza pizza) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(pizza.title),
          subtitle: Text(pizza.garniture),
          leading: const Icon(Icons.local_pizza),
        ),
        Image.network(
          pizza.image,
          height: 120,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4),
          child: Text(pizza.garniture),
        )
      ],
    );
  }

  _buildRow(Pizza pizza) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
          top: Radius.circular(2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetails(pizza, widget._cart),
                ),
              );
            },
            child: _buildPizzaDetails(pizza),
          ),
          BuyButtonWidget(pizza, widget._cart)
        ],
      ),
    );
  }
}
