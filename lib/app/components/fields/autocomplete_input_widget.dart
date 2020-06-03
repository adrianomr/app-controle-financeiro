import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class AutoCompleteInputWidget extends StatefulWidget {
  List _suggestions;
  String _label;
  Function callback;

  AutoCompleteInputWidget(this._suggestions, this._label, {this.callback});

  @override
  State<StatefulWidget> createState() => _AutoCompleteInputWidgetState();
}

class _AutoCompleteInputWidgetState extends State<AutoCompleteInputWidget> {
  String selecionado;

  setTexto(texto) {
    setState(() {
      print(texto);
      selecionado = texto;
      if (widget.callback != null) widget.callback(texto);
    });
    return texto;
  }

  @override
  Widget build(BuildContext context) {
    print(selecionado);
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
          itemSubmitted: setTexto,
          textSubmitted: setTexto,
        ));
  }
}
