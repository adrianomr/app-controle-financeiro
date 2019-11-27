import 'package:controle_financeiro/bloc/shopping-list-bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShoppingListBloc shoppingListBloc =
    Provider.of<ShoppingListBloc>(context);
    // TODO: implement build
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
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add new item',
              ),
              onChanged: (item) {
                shoppingListBloc.editableProductChange(item);
              },
              controller: TextEditingController(text: shoppingListBloc
                  .getEditableProduct()
                  .description),
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
