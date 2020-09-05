import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/bloc/transacao_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/model/transacao_model.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';

class TransacaoPageBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
  AcaoBloc acaoBloc = TransacaoModule.to.getBloc<AcaoBloc>();
  TransacaoBloc transacaoBloc = TransacaoModule.to.getBloc<TransacaoBloc>();
  TipoTransacao tipoTransacao = TipoTransacao.COMPRA;
  Transacao transacao = Transacao(idUsuario: 1, data: DateTime.now());

  @override
  void dispose() {
    super.dispose();
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => acao.papel);
  }

  changeData(DateTime data) {
    transacao.data = data;
  }

  changeQuantidade(int quantidade) {
    transacao.quantidade = quantidade;
  }

  changeValor(double valor) {
    transacao.valor = valor;
  }

  changePapel(String papel) {
    transacao.papel = papel;
  }

  changeTipoTransacao(Map<String, bool> mapTransacaoSelecionada) {
    mapTransacaoSelecionada.forEach((trasancao, isSelecionada) {
      if (isSelecionada) {
        tipoTransacao = transacaoBloc.tipoTransacaoStringToEnum(trasancao);
      }
    });
  }

  submit() {
    if (tipoTransacao == TipoTransacao.COMPRA)
      transacaoBloc.compra(transacao);
    else
      transacaoBloc.venda(transacao);
  }
}
