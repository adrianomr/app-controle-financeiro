import 'package:controle_financeiro/app/util/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SubmitWidget extends StatelessWidget {
  Function _execute;
  Function _validate;

  SubmitWidget(this._execute, {validate}) : this._validate = validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: ColorsUtil.primary,
              textColor: ColorsUtil.secondary,
              onPressed: () {
                if (_validate == null || _validate()) {
                  final pr = ProgressDialog(context,
                      showLogs: true, isDismissible: false);
                  pr.show().then((value) {
                    _execute();
                    pr.hide();
                  });
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
