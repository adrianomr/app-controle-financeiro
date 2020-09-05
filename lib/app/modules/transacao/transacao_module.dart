import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/transacao_bloc.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_page_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_page.dart';
import 'package:flutter/material.dart';

class TransacaoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TransacaoPageBloc()),
        Bloc((i) => AcaoBloc()),
        Bloc((i) => TransacaoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TransacaoPage();

  static Inject get to => Inject<TransacaoModule>.of();
}
