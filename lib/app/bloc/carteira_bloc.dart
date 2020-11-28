import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/model/risco_dto.dart';
import 'package:controle_financeiro/app/service/carteira_service.dart';
import 'package:dio/dio.dart';

class CarteiraBloc extends BlocBase {
  CarteiraService carteiraService = CarteiraService();

  Future<Carteira> getCarteira() async {
    Response response = await carteiraService.getCarteira();
    return Carteira.fromJson(response.data);
  }

  Future<List<Carteira>> getCarteiraList() async {
    Response response = await carteiraService.getCarteiraList();
    List<dynamic> data = response.data;
    return data.map((carteira) => Carteira.fromJson(carteira));
  }

  Future<RiscoDto> getRiscoCarteira() async {
    Response response = await carteiraService.getRiscoCarteira();
    return RiscoDto.fromJson(response.data);
  }
}
