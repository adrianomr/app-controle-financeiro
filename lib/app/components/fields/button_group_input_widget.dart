import 'package:controle_financeiro/app/util/colors_util.dart';
import 'package:flutter/material.dart';

class ButtonGroupnInputWidget extends StatefulWidget {
  Map<String, bool> _itens;
  Function _callback;
  bool isMultiSelect;

  ButtonGroupnInputWidget(this._itens, this._callback,
      {this.isMultiSelect: false});

  @override
  State<StatefulWidget> createState() => _ButtonGroupnInputWidgetState();
}

class _ButtonGroupnInputWidgetState extends State<ButtonGroupnInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 75,
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: ColorsUtil.primary)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getButtons()),
        ));
  }

  List<Widget> getButtons() {
    return widget._itens.keys
        .map((text) => Expanded(
              child: Button(text),
            ))
        .toList();
  }

  Widget Button(String text) {
    return RaisedButton(
      color: widget._itens[text] ? ColorsUtil.primary : ColorsUtil.secondary,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 0,
      onPressed: () {
        setState(() {
          if (!widget.isMultiSelect) {
            widget._itens.updateAll((key, value) => false);
          }
          widget._itens.update(text, (value) => !value);
        });
        widget._callback(widget._itens);
      },
      child: Text(
        text,
        style: TextStyle(
          color:
              widget._itens[text] ? ColorsUtil.secondary : ColorsUtil.primary,
        ),
      ),
    );
  }
}
