import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/corretora_bloc.dart';
import 'package:controle_financeiro/app/bloc/subscricao_bloc.dart';
import 'package:flutter/material.dart';

import 'subscricao_page.dart';
import 'subscricao_page_bloc.dart';

class SubscricaoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SubscricaoPageBloc()),
        Bloc((i) => AcaoBloc()),
        Bloc((i) => SubscricaoBloc()),
        Bloc((i) => CorretoraBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SubscricaoPage();

  static Inject get to => Inject<SubscricaoModule>.of();
}
