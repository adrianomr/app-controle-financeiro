import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputWidget extends StatelessWidget {
  String _label;

  NumberInputWidget(this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          decoration: new InputDecoration(
              labelText: _label, border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly,
          ], //// Only numbers can be
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ));
  }
}
