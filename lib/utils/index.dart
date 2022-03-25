import 'package:flutter/material.dart';

/**
 * 工具函数单元，提供各种需要的函数和公共组件
 */

Future<void> showAlert(
    BuildContext context, String title, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop('OK');
            },
          ),
        ],
      );
    },
  );
}

String safeString(String? src) {
  if (src == null) return '';
  return src;
}
