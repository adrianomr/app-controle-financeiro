import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/transacao_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TransacaoBloc transacaoBloc;

   setUp(() {
     transacaoBloc = TransacaoBloc();
   });

   group('TransacaoBloc Test', () {
     test("Compra Acao", () async {
       bool ok = await transacaoBloc.compra(Transacao(
           idUsuario: 1,
           papel: "BCFF11",
           data: DateTime.now(),
           quantidade: 1,
           valor: 90.5));
       expect(ok, true);
     });

     test("Venda Acao", () async {
       bool ok = await transacaoBloc.venda(Transacao(
           idUsuario: 1,
           papel: "BCFF11",
           data: DateTime.now(),
           quantidade: 1,
           valor: 90.5));
       expect(ok, true);
     });
   });
}
