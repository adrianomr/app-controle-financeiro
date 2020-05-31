import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:controle_financeiro/app/components/charts/pie_chart/pie_chart_widget.dart';
import 'package:controle_financeiro/app/modules/transacao/transacao_bloc.dart';
import 'package:controle_financeiro/app/modules/transacao//transacao_module.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class TransacaoPage extends StatefulWidget {
  final String title;

  const TransacaoPage({Key key, this.title = "Transação"}) : super(key: key);

  @override
  _TransacaoPageState createState() => _TransacaoPageState();
}

class _TransacaoPageState extends State<TransacaoPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TransacaoBloc _acaoBloc = TransacaoModule.to.getBloc<TransacaoBloc>();
    List<String> suggestions = [
      "BCFF11",
      "ITSA4",
      "B3SA3",
      "ITUB3",
      "WIZS3",
      "XPLG11",
    ];
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DateFormField(initialValue: new DateTime.now(),initialDatePickerMode: DatePickerMode.day,label: "",),
              new DropdownButton<String>(
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              AutoCompleteTextField(suggestions: suggestions,
                itemBuilder: (context, suggestion) => new Padding(
                    child: new ListTile(
                        title: new Text(suggestion),
                        trailing: new Text("Stars: ${suggestion}")),
                    padding: EdgeInsets.all(8.0)),

                itemSorter: (a, b) => a == b ? 0 : a > b ? -1 : 1,
                itemFilter: (suggestion, input) =>
                    suggestion.toLowerCase().startsWith(input.toLowerCase()),
              itemSubmitted: (texto){
                print(texto);
                },),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      final pr = ProgressDialog(_scaffoldKey.currentContext, showLogs:true, isDismissible: false);
                      pr.show().then((value) {
                        print('submit');
                          pr.hide();
                      });
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
