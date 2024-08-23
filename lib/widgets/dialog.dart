import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CupertinoAlertDialog(
          content: Row(
            children: [
              Text('Loading...'),
              Spacer(),
              CircularProgressIndicator()
            ],
          ),
        );
      });
}

hideLoading(BuildContext context) {
  Navigator.of(context).pop();
}

showMessage(
  BuildContext context, {
  String? title,
  String? body,
  String? posbtnTitle,
  String? negbtnTitle,
  Function? onPosbtnClick,
  Function? onNegbtnClick,
}) {
  showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: body != null ? Text(body) : null,
          actions: [
            if (posbtnTitle != null)
              TextButton(
                  onPressed: () {
                    onPosbtnClick?.call();
                    Navigator.of(context).pop();
                  },
                  child: Text(posbtnTitle)),
            if (negbtnTitle != null)
              TextButton(
                  onPressed: () {
                    onNegbtnClick?.call();
                    Navigator.of(context).pop();
                  },
                  child: Text(negbtnTitle))
          ],
        );
      });
}