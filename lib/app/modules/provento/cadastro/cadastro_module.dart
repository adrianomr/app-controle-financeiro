import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/modules/provento/cadastro/cadastro_page.dart';
import 'package:controle_financeiro/app/modules/provento/cadastro/cadastro_page_bloc.dart';
import 'package:flutter/material.dart';

class CadastroModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CadastroPageBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CadastroPage();

  static Inject get to => Inject<CadastroModule>.of();
}
