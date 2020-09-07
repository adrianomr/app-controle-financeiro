import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:controle_financeiro/app/bloc/carteira_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/modules/home/home_module.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  BehaviorSubject<Carteira> carteiraBehaviorSubject = BehaviorSubject();
  CarteiraBloc carteiraBloc = HomeModule.to.getBloc<CarteiraBloc>();
  buscaCarteira() async {
    Carteira carteira = await carteiraBloc.getCarteira();
    carteiraBehaviorSubject.add(carteira);
  }

  List<Series> generateSeriesFromCarteira(Carteira carteira){
    return [
      new Series<Acao, String>(
        id: 'Carteira',
        domainFn: (Acao acao, _) => acao.papel,
        measureFn: (Acao acao, _) => acao.valor * acao.quantidade,
        data: carteira.acoes,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (Acao acao, _) => '${acao.papel}',
      )
    ];
  }

  @override
  void dispose() {
    carteiraBehaviorSubject.close();
    super.dispose();
  }
}
