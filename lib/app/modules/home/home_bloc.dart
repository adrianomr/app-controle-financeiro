import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:controle_financeiro/app/bloc/carteira_bloc.dart';
import 'package:controle_financeiro/app/bloc/rebalanceamento_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/carteira_model.dart';
import 'package:controle_financeiro/app/modules/home/home_module.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  BehaviorSubject<Carteira> carteiraBehaviorSubject = BehaviorSubject();
  BehaviorSubject<Carteira> carteiraRebalanceamentoBehaviorSubject =
      BehaviorSubject();
  CarteiraBloc carteiraBloc = HomeModule.to.getBloc<CarteiraBloc>();
  RebalanceamentoBloc rebalanceamentoBloc =
      HomeModule.to.getBloc<RebalanceamentoBloc>();

  buscaCarteira() async {
    Carteira carteira = await carteiraBloc.getCarteira();
    carteiraBehaviorSubject.add(carteira);
  }

  buscaCarteiraRebalanceamento() async {
    Carteira carteira = await rebalanceamentoBloc.getCarteiraRebalanceamento();
    carteiraRebalanceamentoBehaviorSubject.add(carteira);
  }

  List<Series> generateSeriesFromCarteira(Carteira carteira) {
    return [
      new Series<Acao, String>(
        id: 'Carteira',
        domainFn: (Acao acao, _) => acao.papel,
        measureFn: (Acao acao, _) => acao.valor * acao.quantidade,
        data: carteira.acoes,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (Acao acao, _) =>
            '${acao.papel} (${NumberFormat.percentPattern().format((acao.valor * acao.quantidade) / carteira.valorAtual)})',
      )
    ];
  }

  List<Series<dynamic, String>> generateRebalanceamentoSeriesFromCarteira(
      Carteira carteira) {
    return [
      new Series<Acao, String>(
        id: 'Global Revenue',
        domainFn: (Acao acao, _) => acao.papel,
        measureFn: (Acao acao, _) => acao.valor * acao.quantidade,
        labelAccessorFn: (acao, index) =>
            "${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(acao.valor * acao.quantidade)}",
        data: carteira.acoes,
      ),
      new Series<Acao, String>(
        id: 'Los Angeles Revenue',
        domainFn: (Acao acao, _) => acao.papel,
        measureFn: (Acao acao, _) =>
            (acao.percentualRebalanceamento / 100) * carteira.valorAtual,
        labelAccessorFn: (acao, index) =>
            "${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format((acao.percentualRebalanceamento / 100) * carteira.valorAtual)}",
        data: carteira.acoes,
      )
      // Set the 'Los Angeles Revenue' series to use the secondary measure axis.
      // All series that have this set will use the secondary measure axis.
      // All other series will use the primary measure axis.
    ];
  }

  @override
  void dispose() {
    carteiraBehaviorSubject.close();
    carteiraRebalanceamentoBehaviorSubject.close();
    super.dispose();
  }
}
