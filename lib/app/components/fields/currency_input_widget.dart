import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CurrencyInputWidget extends StatelessWidget {
  String _label;
  Function callback;
  CurrencyInputWidget(this._label, {this.callback});

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
          ],
          controller: MoneyMaskedTextController(
              decimalSeparator: '.',
              thousandSeparator: ',',
              leftSymbol: 'R\$ '),
          onChanged: (value) => callback(double.parse(value)/100),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ));
  }
}
