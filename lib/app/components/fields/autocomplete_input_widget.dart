import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoCompleteInputWidget extends StatelessWidget {
  String _label;
  Function filter;
  Function callback;

  AutoCompleteInputWidget(this._label, {this.filter, this.callback});

  final TextEditingController _typeAheadController = TextEditingController();
  String _selected;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          controller: _typeAheadController,
          autofocus: true,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.italic),
          decoration:
              InputDecoration(labelText: _label, border: OutlineInputBorder())),
      suggestionsCallback: (pattern) async {
        return await filter(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      errorBuilder: (buildContext, object) => ListTile(
        title: Text("Nenhuma ação encontrada"),
      ),
      onSuggestionSelected: (suggestion) {
        this._typeAheadController.text = suggestion;
        if (callback != null) callback(suggestion);
      },
    );
  }
}
