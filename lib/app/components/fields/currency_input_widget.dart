import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CurrencyInputWidget extends StatelessWidget {
  String _label;

  CurrencyInputWidget(this._label);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(labelText: _label),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      //// Only numbers can be
      controller: MoneyMaskedTextController(
          decimalSeparator: '.', thousandSeparator: ',', leftSymbol: 'R\$ '),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
