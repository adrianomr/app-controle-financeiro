import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/carteira_bloc.dart';
import 'package:controle_financeiro/app/bloc/rebalanceamento_bloc.dart';
import 'package:controle_financeiro/app/modules/home/home_bloc.dart';
import 'package:controle_financeiro/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs =>
      [
        Bloc((i) => HomeBloc()),
        Bloc((i) => CarteiraBloc()),
        Bloc((i) => RebalanceamentoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
