import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoCompleteInputWidget extends StatefulWidget {
  String _label;
  Function filter;
  Function callback;

  AutoCompleteInputWidget(this._label, {this.filter, this.callback});

  @override
  State<StatefulWidget> createState() {
    return _AutoCompleteInputWidgetState();
  }
}

class _AutoCompleteInputWidgetState extends State<AutoCompleteInputWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  TypeAheadField _typeAheadField;
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
          decoration: InputDecoration(
              labelText: widget._label, border: OutlineInputBorder())),
      suggestionsCallback: (pattern) async {
        return await widget.filter(pattern);
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
        if (suggestion != null) {
          if (suggestion is String) {
            this._typeAheadController.text = suggestion;
            widget.callback(suggestion);
          } else {
            this._typeAheadController.text = suggestion.text;
            widget.callback(suggestion.id, suggestion.text);
          }
        } else {
          this._typeAheadController.text = null;
        }
      },
    );
  }
}
