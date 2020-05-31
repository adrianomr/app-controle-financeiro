import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class AutoCompleteInputWidget extends StatelessWidget {
  List _suggestions;

  AutoCompleteInputWidget(this._suggestions);

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField(
      suggestions: _suggestions,
      itemBuilder: (context, suggestion) => new Padding(
          child: new ListTile(
              title: new Text(suggestion),
              trailing: new Text("Stars: ${suggestion}")),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a == b ? 0 : a > b ? -1 : 1,
      itemFilter: (suggestion, input) =>
          suggestion.toLowerCase().startsWith(input.toLowerCase()),
      itemSubmitted: (texto) {
        print(texto);
      },
    );
  }
}
