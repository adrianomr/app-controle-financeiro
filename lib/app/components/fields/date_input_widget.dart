import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class DateInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DateFormField(
      initialValue: new DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      label: "",
    );
  }
}
