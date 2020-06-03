import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class AutoCompleteInputWidget extends StatefulWidget {
  List _suggestions;
  String _label;

  AutoCompleteInputWidget(this._suggestions, this._label);

  @override
  State<StatefulWidget> createState() => _AutoCompleteInputWidgetState();
}

class _AutoCompleteInputWidgetState extends State<AutoCompleteInputWidget> {
  String selecionado = '';

  @override
  void initState() {
    // TODO: implement initState
    selecionado = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: AutoCompleteTextField(
          controller: TextEditingController(text: selecionado),
          decoration: new InputDecoration(
              labelText: widget._label, border: OutlineInputBorder()),
          suggestions: widget._suggestions,
          itemBuilder: (context, suggestion) => new Padding(
              child: new ListTile(
                title: new Text(suggestion),
              ),
              padding: EdgeInsets.all(8.0)),
          itemSorter: (a, b) => a == b ? 0 : a > b ? -1 : 1,
          itemFilter: (suggestion, input) =>
              suggestion.toLowerCase().startsWith(input.toLowerCase()),
          clearOnSubmit: false,
          itemSubmitted: (texto) {
            setState(() {
              print(texto);
              selecionado = texto;
            });
            return texto;
          },
        ));
  }
}
