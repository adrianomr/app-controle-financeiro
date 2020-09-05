import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AcaoBloc acaoBloc;

   setUp(() {
     acaoBloc = AcaoBloc();
   });

   group('AcaoBloc Test', () {
     test("Test busca acoes por papel", () async {
       List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining("BCFF");
       expect(acoes.length, greaterThan(0));
     });
   });
}
