import 'package:awesome2/drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // var myText = "India Walle";
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  // get http => null;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));
    drinks = jsonDecode(res.body)['drinks'];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text("Coctail App"),
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: "idDrink",
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              drink["strDrinkThumb"],
                            ),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DrinkDetail(drink: drink),
                                // fullscreenDialog: true
                              ));
                        },
                      );
                    })
                : CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  )));
  }
}
