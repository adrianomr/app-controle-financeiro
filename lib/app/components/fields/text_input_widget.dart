import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  String _label;
  Function callback;

  TextInputWidget(this._label, {this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          decoration: new InputDecoration(
              labelText: _label, border: OutlineInputBorder()),
          onChanged: callback,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ));
  }
}
