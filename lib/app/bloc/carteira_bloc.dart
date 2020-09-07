import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/service/acao_service.dart';
import 'package:controle_financeiro/app/service/carteira_service.dart';
import 'package:dio/dio.dart';

class CarteiraBloc extends BlocBase {
  CarteiraService carteiraService = CarteiraService();

  Future<Carteira> getCarteira() async {
    Response response = await carteiraService.getCarteira();
    return Carteira.fromJson(response.data);
  }
}
