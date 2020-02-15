import 'package:controle_financeiro/bloc/product-bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductBlocProv extends StatelessWidget {
  Widget child;

  ProductBlocProv({Widget this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductBloc>.value(value: ProductBloc())
      ],
      child: child,
    );
    ;
  }
}
