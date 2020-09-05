import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:controle_financeiro/app/modules/transacao/transacao_page_bloc.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';

void main() {
  initModule(TransacaoModule());
  TransacaoPageBloc bloc;

  // setUp(() {
  //     bloc = AcaoModule.to.bloc<AcaoBloc>();
  // });

  // group('AcaoBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<AcaoBloc>());
  //   });
  // });
}
