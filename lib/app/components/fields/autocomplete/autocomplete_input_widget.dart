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
          autofocus: false,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.italic),
          decoration:
              InputDecoration(labelText: _label, border: OutlineInputBorder())),
      suggestionsCallback: (pattern) async {
        return await filter(pattern);
      },
      itemBuilder: (context, suggestion) {
        if (suggestion is String)
          return ListTile(
            title: Text(suggestion),
          );
        else
          return ListTile(
            title: Text(suggestion.text),
          );
      },
      errorBuilder: (buildContext, object) => ListTile(
        title: Text("Nenhuma ação encontrada"),
      ),
      onSuggestionSelected: (suggestion) {
        if (callback != null) {
          if (callback is String) {
            this._typeAheadController.text = suggestion;
            callback(suggestion);
          }
          this._typeAheadController.text = suggestion.text;
          callback(suggestion.id, suggestion.text);
        } else {
          this._typeAheadController.text = null;
        }
      },
    );
  }
}
