import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputWidget extends StatelessWidget {
  String _label;
  Function callback;

  NumberInputWidget(this._label, {this.callback});

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
          onChanged: (text) => callback(int.parse(text)),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ));
  }
}
