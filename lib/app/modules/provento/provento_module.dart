import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/provento_bloc.dart';
import 'package:controle_financeiro/app/modules/provento/provento_page.dart';
import 'package:controle_financeiro/app/modules/provento/provento_page_bloc.dart';
import 'package:flutter/material.dart';

class ProventoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ProventoPageBloc()),
        Bloc((i) => AcaoBloc()),
        Bloc((i) => ProventoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ProventoPage();

  static Inject get to => Inject<ProventoModule>.of();
}
