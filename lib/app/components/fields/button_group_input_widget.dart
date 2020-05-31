import 'package:flutter/material.dart';

class ButtonGroupnInputWidget extends StatelessWidget {
  List<String> _itens;

  ButtonGroupnInputWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            SpecialChar("Compra"),
            SpecialChar("Venda"),
          ],
        ),
      ),
    );
  }

  Widget SpecialChar(String text) {
    return ButtonTheme(
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
