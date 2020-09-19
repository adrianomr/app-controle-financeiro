import 'package:controle_financeiro/app/util/colors_util.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class DateInputWidget extends StatelessWidget {
  String _label;
  Function callback;
  DateTime data;

  DateInputWidget(this._label, this.data, {this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: DateField(
          initialDatePickerMode: DatePickerMode.day,
          label: _label,
          onDateSelected: (date) => callback(date),
          selectedDate: data ?? DateTime.now(),
          decoration: InputDecoration(
              labelText: _label,
              labelStyle: TextStyle(fontSize: 14.0, color: ColorsUtil.primary),
              border: OutlineInputBorder()),
        ));
  }
}
