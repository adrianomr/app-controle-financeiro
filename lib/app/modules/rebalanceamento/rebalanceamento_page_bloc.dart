import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/rebalanceamento_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/rebalanceamento_model.dart';
import 'package:controle_financeiro/app/modules/rebalanceamento/rebalanceamento_module.dart';
import 'package:rxdart/rxdart.dart';

class RebalanceamentoPageBloc extends BlocBase {
  AcaoBloc acaoBloc = RebalanceamentoModule.to.getBloc<AcaoBloc>();
  RebalanceamentoBloc rebalanceamentoBloc =
      RebalanceamentoModule.to.getBloc<RebalanceamentoBloc>();
  Rebalanceamento rebalanceamento = Rebalanceamento(acao: Acao());
  BehaviorSubject<List<Rebalanceamento>> rebalanceamentoListBehaviorSubject =
      BehaviorSubject();

  @override
  void dispose() {
    rebalanceamentoListBehaviorSubject.close();
    super.dispose();
  }

  getRebalanceamentoList() async {
    rebalanceamentoListBehaviorSubject
        .add(await rebalanceamentoBloc.getListRebalanceamento());
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => acao.papel);
  }

  changePercentual(double percentual) {
    rebalanceamento.percentual = percentual;
  }

  changePapel(String papel) {
    rebalanceamento.acao.papel = papel;
  }

  submit() async {
    List<Acao> acoes =
        await acaoBloc.findAcaoByPapelContaining(rebalanceamento.acao.papel);
    rebalanceamento.acao = acoes[0];
    await rebalanceamentoBloc.criaRebalanceamento(rebalanceamento);
    await getRebalanceamentoList();
  }

  Future<void> delete(Rebalanceamento rebalanceamento) async {
    await rebalanceamentoBloc.delete(rebalanceamento);
    await getRebalanceamentoList();
  }
}
