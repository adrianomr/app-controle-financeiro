import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/rebalanceamento_bloc.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_page.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_page_bloc.dart';
import 'package:flutter/material.dart';

class RebalanceamentoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => RebalanceamentoPageBloc()),
        Bloc((i) => RebalanceamentoBloc()),
        Bloc((i) => AcaoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => RebalanceamentoPage();

  static Inject get to => Inject<RebalanceamentoModule>.of();
}
