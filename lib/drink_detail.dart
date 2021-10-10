import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final drink;
  const DrinkDetail({Key? key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink["strDrink"]),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: drink["idDrink"],
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                drink["strDrinkThumb"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
