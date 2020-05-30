import 'package:controle_financeiro/app/modules/transacao/transacao_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_page.dart';
import 'package:flutter/material.dart';

class TransacaoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => TransacaoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TransacaoPage();

  static Inject get to => Inject<TransacaoModule>.of();
}
