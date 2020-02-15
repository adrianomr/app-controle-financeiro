import 'package:controle_financeiro/blocprov/product-blocprov.dart';
import 'package:controle_financeiro/blocprov/shoping-list-blocprov.dart';
import 'package:controle_financeiro/screen/shoppingList/shopping-list.widget.dart';
import 'package:controle_financeiro/theme/style.dart';
import 'package:flutter/material.dart';

import 'screen/shoppingList/home.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShoppingListBlocprov(
        child: ProductBlocProv(
            child: MaterialApp(
                title: 'Flutter Demo',
                theme: Style(),
                home: HomeWidget(title: 'Flutter Demo Home Page'),
                routes: <String, WidgetBuilder>{
                  "/shopping-list": (BuildContext context) =>
                      ShoppingListWidget(),
                })));
  }
}