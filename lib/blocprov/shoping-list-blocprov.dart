import 'package:controle_financeiro/bloc/shopping-list-bloc.dart';
import 'package:flutter/material.dart';

class ShoppingListBlocprov extends InheritedWidget {
  final ShoppingListBloc bloc;

  ShoppingListBlocprov({Key key, this.bloc, child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ShoppingListBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ShoppingListBlocprov)
              as ShoppingListBlocprov)
          .bloc;
}
