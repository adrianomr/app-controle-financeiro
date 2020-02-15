import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:controle_financeiro/bloc/product-bloc.dart';
import 'package:controle_financeiro/bloc/shopping-list-bloc.dart';
import 'package:controle_financeiro/models/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingListWidget extends StatelessWidget {
  Widget row(Product product) {
    print('aqui' + product.toJson().toString());
    return Row(
      children: <Widget>[
        Text(
          product.description,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ShoppingListBloc shoppingListBloc =
    Provider.of<ShoppingListBloc>(context);
    final ProductBloc productBloc = Provider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Market List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          shoppingListBloc.addProduct();
        },
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            AutoCompleteTextField<Product>(
              suggestions: productBloc.getProducts(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add new item',
              ),
              textChanged: (item) {
                shoppingListBloc.editableProductChange(item);
              },
              controller: TextEditingController(
                  text: shoppingListBloc
                      .getEditableProduct()
                      .description),
              itemBuilder: (context, item) {
                return row(item);
              },
              itemFilter: (item, query) =>
                  item.description.toLowerCase().startsWith(query),
              itemSubmitted: (product) =>
                  shoppingListBloc.editableProductChange(product.description),
            ),
            Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: shoppingListBloc.getCountItens(),
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: Key(index.toString()),
                          child: Text(shoppingListBloc
                              .getProduct(index)
                              .description),
                          onDismissed: (direction) {
                            shoppingListBloc.removeProduct(index);
                          },
                        );
                      }),
                ))
          ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
