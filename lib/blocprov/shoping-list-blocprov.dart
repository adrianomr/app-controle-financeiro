import 'package:controle_financeiro/bloc/shopping-list-bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingListBlocprov extends StatelessWidget {
  Widget child;

  ShoppingListBlocprov({Widget this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ShoppingListBloc>.value(
          value: ShoppingListBloc()
      )
      ],
      child: child,
    );;
  }

}
