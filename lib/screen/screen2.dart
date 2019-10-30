import 'package:controle_financeiro/bloc/shopping-list-bloc.dart';
import 'package:controle_financeiro/blocprov/shoping-list-blocprov.dart';
import 'package:controle_financeiro/model/product.dart';
import 'package:controle_financeiro/model/shopping-list.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  Screen2State createState() => Screen2State();
}

class Screen2State extends State<Screen2> {
  ShoppingListBloc shoppingListBloc = ShoppingListBloc();
  Product item;

  Screen2State();

  @override
  void initState() {
    super.initState();
    shoppingListBloc.addProduct(new Product("1", "Prod 1", 1));
    shoppingListBloc.addProduct(new Product("2", "Prod 2", 2));
    shoppingListBloc.addProduct(new Product("3", "Prod 3", 3));
    shoppingListBloc.addProduct(new Product("4", "Prod 4", 4));
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingListBlocprov(
        bloc: shoppingListBloc,
        child: Scaffold(
          appBar: AppBar(

            title: Text('Market List'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                shoppingListBloc.addProduct(item);
              });
            },
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Add new item'),
                      onChanged: (item) {
                        setState(() {
                          this.item = Product("", item, 0);
                        });
                      },
                    ),
                    Expanded(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                              itemCount: shoppingListBloc.shoppingList.products
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  key: Key(index.toString()),
                                  child: Text(shoppingListBloc.shoppingList
                                      .products[index].name),
                                  onDismissed: (direction) {
                                    shoppingListBloc.shoppingList.products
                                        .removeAt(
                                        index);
                                  },
                                );
                              }
                          ),
                        )
                    )
                  ]
              )
          ), // This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }
}
