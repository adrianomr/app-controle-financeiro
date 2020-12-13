import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/grupo_acao_bloc.dart';
import 'package:flutter/material.dart';

import 'grupo_acao_page.dart';
import 'grupo_acao_page_bloc.dart';

class GrupoAcaoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GrupoAcaoPageBloc()),
        Bloc((i) => AcaoBloc()),
        Bloc((i) => GrupoAcaoBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => GrupoAcaoPage();

  static Inject get to => Inject<GrupoAcaoModule>.of();
}
