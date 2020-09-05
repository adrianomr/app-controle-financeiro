import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:charts_common/src/data/series.dart';
import 'package:controle_financeiro/app/bloc/acao_bloc.dart';
import 'package:controle_financeiro/app/model/acao_model.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_module.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_page.dart';

class TransacaoBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
  AcaoBloc acaoBloc = TransacaoModule.to.getBloc<AcaoBloc>();
  @override
  void dispose() {
    super.dispose();
  }

  findAcao(String texto) async {
    List<Acao> acoes = await acaoBloc.findAcaoByPapelContaining(texto);
    return acoes.map((acao) => acao.papel);
  }
}
