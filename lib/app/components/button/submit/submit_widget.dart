import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SubmitWidget extends StatelessWidget {
  Function _execute;
  Function _validate;

  SubmitWidget(this._execute, {validate}) : this._validate = validate;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (_validate == null || _validate()) {
          final pr =
              ProgressDialog(context, showLogs: true, isDismissible: false);
          pr.show().then((value) {
            _execute();
            pr.hide();
          });
        }
      },
      child: Text('Submit'),
    );
  }
}
