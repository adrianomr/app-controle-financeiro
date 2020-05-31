import 'package:flutter/material.dart';

class DropdownInputWidget extends StatelessWidget {
  List<String> _itens;

  DropdownInputWidget(this._itens);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: _itens.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
